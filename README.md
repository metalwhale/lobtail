# lobtail
Waves rise when whales lobtail

## Disclaimer
This tool is intended for personal research purposes. Please refer to the terms of use of each data source listed in [`./skimmer`](./skimmer/) folder for more details regarding the rights to use the data.

## Development
1. Start the containers:
    ```bash
    cd ./infra-dev
    docker-compose up -d
    ```
2. Collecting data:\
    Get inside the `skimmer` container:
    ```bash
    docker-compose exec -it skimmer bash
    ```
    Run this command:
    ```bash
    zig build run -- ../lobtail/data/raw/
    ```
3. Training:
    ```bash
    docker-compose exec -it lobtail bash
    ```
