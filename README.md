# DRP-AI-Translator-env
This generates an Ubuntu Docker Image as the operating environment for the DRP-AI Translator.

# DRP-AI Translator Installer
- Installer download

    https://www.renesas.com/ja/products/microcontrollers-microprocessors/rz-arm-based-high-end-32-64-bit-mpus/drp-ai-translator

- Docker build & Docker run
    ```bash
    docker build . \
    -t drp-ai-translator \
    --build-arg DRPINSTALLER=r20ut5035ej0185-drp-ai-translator

    docker run --rm -it \
    -v `pwd`:/workdir \
    drp-ai-translator
    ```