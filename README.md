# lobtail
Waves rise when whales lobtail

## Development
1. Get inside the container:
    ```bash
    cd ./infra-dev
    docker-compose up -d
    docker-compose exec -it lobtail bash
    ```
2. Fetch data:
    ```bash
    python -m data.fetcher
    ```

## References
- [`awesome-quant`](https://github.com/wilsonfreitas/awesome-quant)
- [Yes, Transformers are Effective for Time Series Forecasting (+ Autoformer)](https://huggingface.co/blog/autoformer)
- [Portfolio Transformer for Attention-Based Asset Allocation](https://arxiv.org/pdf/2206.03246.pdf)
