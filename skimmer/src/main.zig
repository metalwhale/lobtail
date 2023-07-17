const std = @import("std");

pub fn main() !void {
    // https://ziglang.org/documentation/master/#Choosing-an-Allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    var args = std.process.args();
    _ = std.mem.sliceTo(args.next().?, 0);
    const raw_data_dir_path = std.mem.sliceTo(args.next().?, 0);
    const symbol = "AAPL";
    try getHistoricalData(allocator, symbol, raw_data_dir_path);
}

pub fn getHistoricalData(allocator: std.mem.Allocator, symbol: []const u8, raw_data_dir_path: []const u8) !void {
    const uri_text = try std.fmt.allocPrint(
        allocator,
        "https://query1.finance.yahoo.com/v8/finance/chart/{s}?interval=1d&period1=0&period2={d}",
        .{ symbol, std.time.timestamp() },
    );
    const uri = try std.Uri.parse(uri_text);
    var client: std.http.Client = .{ .allocator = allocator };
    defer client.deinit();
    var request = try client.request(.GET, uri, .{ .allocator = allocator }, .{});
    defer request.deinit();
    try request.start();
    try request.wait();
    const file_path = try std.fmt.allocPrint(
        allocator,
        "{s}/{s}.json",
        .{ raw_data_dir_path, symbol },
    );
    var file = try std.fs.cwd().createFile(file_path, .{ .truncate = true });
    defer file.close();
    while (true) {
        var buffer: [4096]u8 = undefined;
        const n_bytes = try request.reader().read(&buffer);
        if (n_bytes == 0) {
            break;
        }
        _ = try file.write(buffer[0..n_bytes]);
    }
}
