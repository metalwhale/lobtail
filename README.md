# lobtail
Waves rise when whales lobtail

## Local development
### Startup
1. Create a `.env` file by copying from [`./local.env`](./local.env):
    ```bash
    cp local.env .env
    ```
    and then fill in the variables with appropriate values in the `.env` file.
2. Start the containers:
    ```bash
    docker compose up -d
    ```

### Collect the data
1. Get inside the container:
    ```bash
    docker compose exec -it collector bash
    ```
2. Run the command:
    ```bash
    python scripts/data_collector/yahoo/collector.py download_data --source_dir /usr/src/lobtail/data/us_data --start 1900-01-01 --end 2024-12-31 --delay 1 --interval 1d --region US
    ```

### Play on the beach
1. Get inside the container:
    ```bash
    docker compose exec -it beach bash
    ```

## References
- [`awesome-quant`](https://github.com/wilsonfreitas/awesome-quant)
- [`Qlib`](https://github.com/microsoft/qlib)
- [`DeepDow`](https://github.com/jankrepl/deepdow)
- [`FinGPT`](https://github.com/ai4finance-foundation/fingpt)
- [Yes, Transformers are Effective for Time Series Forecasting (+ Autoformer)](https://huggingface.co/blog/autoformer)
- [Portfolio Transformer for Attention-Based Asset Allocation](https://arxiv.org/pdf/2206.03246.pdf)
