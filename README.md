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
