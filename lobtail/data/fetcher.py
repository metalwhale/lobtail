import csv
import os
import pathlib
from time import strftime, localtime

import requests


def fetch_bitfinex_candles(pair: str = "tBTCUSD", limit: int = 10000):
    # See: https://docs.bitfinex.com/reference/rest-public-candles
    url = f"https://api-pub.bitfinex.com/v2/candles/trade:1D:{pair}/hist?limit={limit}"
    headers = {"accept": "application/json"}
    response = requests.get(url, headers=headers)
    with open(os.path.join(pathlib.Path(__file__).parent.resolve(), "raw", f"{pair}.csv"), "w") as candles_file:
        candles_writer = csv.writer(candles_file)
        candles_writer.writerow(["MTS", "OPEN", "CLOSE", "HIGH", "LOW", "VOLUME", "IS_MISSING"])
        candles = list(response.json())
        candles.reverse()  # Ascending order
        last_candle = None
        for candle in candles:
            MILLISECONDS_IN_DAY = 24 * 60 * 60 * 1000
            if last_candle is not None:
                for t in range(last_candle[0] + MILLISECONDS_IN_DAY, candle[0], MILLISECONDS_IN_DAY):
                    candles_writer.writerow([strftime("%Y-%m-%d", localtime(t // 1000)), *last_candle[1:], True])
            candles_writer.writerow([strftime("%Y-%m-%d", localtime(candle[0] // 1000)), *candle[1:], False])
            last_candle = candle


if __name__ == "__main__":
    fetch_bitfinex_candles()
