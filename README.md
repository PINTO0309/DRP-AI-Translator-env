# DRP-AI-Translator-env
This generates an Ubuntu Docker Image as the operating environment for the DRP-AI Translator.

# DRP-AI Translator Install
- Installer download (`.zip`)

    https://www.renesas.com/ja/products/microcontrollers-microprocessors/rz-arm-based-high-end-32-64-bit-mpus/drp-ai-translator

- Docker build & Docker run
    ```bash
    ls -lh
    total 271M
    -rw-rw-r-- 1 xxxx xxxx 1.1K 10月 10 08:27 Dockerfile
    -rw-rw-r-- 1 xxxx xxxx  12K 10月  9 22:23 LICENSE
    -rw-rw-r-- 1 xxxx xxxx 271M 10月  9 22:27 r20ut5035ej0185-drp-ai-translator.zip
    -rw-rw-r-- 1 xxxx xxxx  538 10月 10 08:29 README.md

    docker build . \
    -t drp-ai-translator \
    --build-arg DRPINSTALLER=r20ut5035ej0185-drp-ai-translator

    docker run --rm -it \
    -v `pwd`:/workdir \
    drp-ai-translator

    ls -lh /workdir/

    total 271M
    -rw-rw-r-- 1 user user 1.1K Oct  9 23:27 Dockerfile
    -rw-rw-r-- 1 user user  12K Oct  9 13:23 LICENSE
    -rw-rw-r-- 1 user user  820 Oct  9 23:30 README.md
    -rw-rw-r-- 1 user user 271M Oct  9 13:27 r20ut5035ej0185-drp-ai-translator.zip

    ls -lh .

    total 48K
    drwxrwxr-x 1 user user 4.0K Oct  9 23:30 DRP-AI_translator
    drwxrwxr-x 1 user user 4.0K Oct  9 23:29 UserConfig
    drwxrwxr-x 1 user user 4.0K Oct  9 23:29 onnx
    -rwxrwxr-x 1 user user  13K Sep 12 02:55 run_DRP-AI_translator_V2L.sh
    -rwxrwxr-x 1 user user  13K Sep 12 02:55 run_DRP-AI_translator_V2M.sh
    -rwxrwxr-x 1 user user  613 Sep 12 02:55 user_setup.sh
    ```

- VSCode & Dev Container

    ![image](https://github.com/user-attachments/assets/d247c473-4569-45cb-a286-998a26b33bca)