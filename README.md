# DRP-AI-Translator-env
This generates an Ubuntu Docker Image as the operating environment for the DRP-AI Translator.

## DRP-AI Translator Install
- Installer download (`.zip`)

    You will need to create an account and log in.

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

    ![image](https://github.com/user-attachments/assets/14b2bcea-cb0d-4e3b-b2f6-86263ebaf5d3)

## Tests

```
cd /drp/drp-ai_translator_release/

ls -lh

total 48K
drwxrwxr-x 1 user user 4.0K Oct  9 23:43 DRP-AI_translator
drwxrwxr-x 1 user user 4.0K Oct  9 23:43 UserConfig
drwxrwxr-x 1 user user 4.0K Oct  9 23:43 onnx
-rwxrwxr-x 1 user user  13K Sep 12 02:55 run_DRP-AI_translator_V2L.sh
-rwxrwxr-x 1 user user  13K Sep 12 02:55 run_DRP-AI_translator_V2M.sh
-rwxrwxr-x 1 user user  613 Sep 12 02:55 user_setup.sh

./run_DRP-AI_translator_V2L.sh

[Run DRP-AI Translator] Ver. 1.85
[DRP-AI translator] run script
 Please input PREFIX.
 >>> test
    PREFIX: test
 Please select model No
   1: resnet50v1  (Download from onnx model zoo)
   2: VGG16       (Download from onnx model zoo)
   3: tiny_yolov2 (Included in DRP-AI Translator)
   4: yolov2      (Included in DRP-AI Translator)
 >>> 1
    The file size about 97.8[MB]
    URL : https://github.com/onnx/models/tree/main/validated/vision/classification/resnet
--2024-10-10 00:09:42--  https://github.com/onnx/models/raw/main/validated/vision/classification/resnet/model/resnet50-v1-7.onnx
Resolving github.com (github.com)... 20.27.177.113
Connecting to github.com (github.com)|20.27.177.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://media.githubusercontent.com/media/onnx/models/main/validated/vision/classification/resnet/model/resnet50-v1-7.onnx [following]
--2024-10-10 00:09:42--  https://media.githubusercontent.com/media/onnx/models/main/validated/vision/classification/resnet/model/resnet50-v1-7.onnx
Resolving media.githubusercontent.com (media.githubusercontent.com)... 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
Connecting to media.githubusercontent.com (media.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 102583340 (98M) [application/octet-stream]
Saving to: './onnx/resnet50v1.onnx'

./onnx/resnet50v1.onnx                             100%[==========>]  97.83M  83.8MB/s    in 1.2s

2024-10-10 00:09:48 (83.8 MB/s) - './onnx/resnet50v1.onnx' saved [102583340/102583340]

[Input file information]
   PREFIX               : test
   ONNX Model           : ./onnx/resnet50v1.onnx
   Prepost file         : ./UserConfig/sample/prepost_resnet50v1.yaml
   Address mapping file : ./UserConfig/sample/addrmap_in_resnet50v1.yaml
Skip prepost file check
------------------------------------------
[api-translator] start
Compare input/output shape definition in ONNX and pre/post YAML file.

Warning
  Dyanmic shape on Batch dimension is subustituted by 1.
    data: ['N', 3, 224, 224]


Warning
  Dyanmic shape on Batch dimension is subustituted by 1.
    resnetv17_dense0_fwd: ['N', 1000]

Reading ONNX Parameters.
done
Parsing ONNX Nodes.

done
Convert ONNX model into IR format.
done.
  Conv(ker=7, st=2, pad=3, bias=True)      (1, 3, 224, 224)    (1, 64, 112, 112)   resnetv17_conv0_fwd
  Relu()                                   (1, 64, 112, 112)   (1, 64, 112, 112)   resnetv17_relu0_fwd
  MaxPool(ker=3, st=2, pad=1)              (1, 64, 112, 112)   (1, 64, 56, 56)     resnetv17_pool0_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_conv0_fwd
  Relu()                                   (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_relu0_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_conv1_fwd
  Relu()                                   (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_relu1_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 64, 56, 56)     (1, 256, 56, 56)    resnetv17_stage1_conv2_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 64, 56, 56)     (1, 256, 56, 56)    resnetv17_stage1_conv3_fwd
  Add()                                    (1, 256, 56, 56)    (1, 256, 56, 56)    resnetv17_stage1__plus0
  Relu()                                   (1, 256, 56, 56)    (1, 256, 56, 56)    resnetv17_stage1_activation0
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 56, 56)    (1, 64, 56, 56)     resnetv17_stage1_conv4_fwd
  Relu()                                   (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_relu2_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_conv5_fwd
  Relu()                                   (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_relu3_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 64, 56, 56)     (1, 256, 56, 56)    resnetv17_stage1_conv6_fwd
  Add()                                    (1, 256, 56, 56)    (1, 256, 56, 56)    resnetv17_stage1__plus1
  Relu()                                   (1, 256, 56, 56)    (1, 256, 56, 56)    resnetv17_stage1_activation1
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 56, 56)    (1, 64, 56, 56)     resnetv17_stage1_conv7_fwd
  Relu()                                   (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_relu4_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_conv8_fwd
  Relu()                                   (1, 64, 56, 56)     (1, 64, 56, 56)     resnetv17_stage1_relu5_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 64, 56, 56)     (1, 256, 56, 56)    resnetv17_stage1_conv9_fwd
  Add()                                    (1, 256, 56, 56)    (1, 256, 56, 56)    resnetv17_stage1__plus2
  Relu()                                   (1, 256, 56, 56)    (1, 256, 56, 56)    resnetv17_stage1_activation2
  Conv(ker=1, st=2, pad=0, bias=True)      (1, 256, 56, 56)    (1, 128, 28, 28)    resnetv17_stage2_conv0_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu0_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv1_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu1_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 128, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_conv2_fwd
  Conv(ker=1, st=2, pad=0, bias=True)      (1, 256, 56, 56)    (1, 512, 28, 28)    resnetv17_stage2_conv3_fwd
  Add()                                    (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2__plus0
  Relu()                                   (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_activation0
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 512, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv4_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu2_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv5_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu3_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 128, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_conv6_fwd
  Add()                                    (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2__plus1
  Relu()                                   (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_activation1
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 512, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv7_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu4_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv8_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu5_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 128, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_conv9_fwd
  Add()                                    (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2__plus2
  Relu()                                   (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_activation2
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 512, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv10_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu6_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_conv11_fwd
  Relu()                                   (1, 128, 28, 28)    (1, 128, 28, 28)    resnetv17_stage2_relu7_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 128, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_conv12_fwd
  Add()                                    (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2__plus3
  Relu()                                   (1, 512, 28, 28)    (1, 512, 28, 28)    resnetv17_stage2_activation3
  Conv(ker=1, st=2, pad=0, bias=True)      (1, 512, 28, 28)    (1, 256, 14, 14)    resnetv17_stage3_conv0_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu0_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_conv1_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu1_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 14, 14)    (1, 1024, 14, 14)   resnetv17_stage3_conv2_fwd
  Conv(ker=1, st=2, pad=0, bias=True)      (1, 512, 28, 28)    (1, 1024, 14, 14)   resnetv17_stage3_conv3_fwd
  Add()                                    (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3__plus0
  Relu()                                   (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3_activation0
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 256, 14, 14)    resnetv17_stage3_conv4_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu2_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_conv5_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu3_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 14, 14)    (1, 1024, 14, 14)   resnetv17_stage3_conv6_fwd
  Add()                                    (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3__plus1
  Relu()                                   (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3_activation1
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 256, 14, 14)    resnetv17_stage3_conv7_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu4_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_conv8_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu5_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 14, 14)    (1, 1024, 14, 14)   resnetv17_stage3_conv9_fwd
  Add()                                    (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3__plus2
  Relu()                                   (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3_activation2
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 256, 14, 14)    resnetv17_stage3_conv10_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu6_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_conv11_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu7_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 14, 14)    (1, 1024, 14, 14)   resnetv17_stage3_conv12_fwd
  Add()                                    (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3__plus3
  Relu()                                   (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3_activation3
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 256, 14, 14)    resnetv17_stage3_conv13_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu8_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_conv14_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu9_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 14, 14)    (1, 1024, 14, 14)   resnetv17_stage3_conv15_fwd
  Add()                                    (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3__plus4
  Relu()                                   (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3_activation4
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 256, 14, 14)    resnetv17_stage3_conv16_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu10_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_conv17_fwd
  Relu()                                   (1, 256, 14, 14)    (1, 256, 14, 14)    resnetv17_stage3_relu11_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 256, 14, 14)    (1, 1024, 14, 14)   resnetv17_stage3_conv18_fwd
  Add()                                    (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3__plus5
  Relu()                                   (1, 1024, 14, 14)   (1, 1024, 14, 14)   resnetv17_stage3_activation5
  Conv(ker=1, st=2, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 512, 7, 7)      resnetv17_stage4_conv0_fwd
  Relu()                                   (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_relu0_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_conv1_fwd
  Relu()                                   (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_relu1_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 512, 7, 7)      (1, 2048, 7, 7)     resnetv17_stage4_conv2_fwd
  Conv(ker=1, st=2, pad=0, bias=True)      (1, 1024, 14, 14)   (1, 2048, 7, 7)     resnetv17_stage4_conv3_fwd
  Add()                                    (1, 2048, 7, 7)     (1, 2048, 7, 7)     resnetv17_stage4__plus0
  Relu()                                   (1, 2048, 7, 7)     (1, 2048, 7, 7)     resnetv17_stage4_activation0
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 2048, 7, 7)     (1, 512, 7, 7)      resnetv17_stage4_conv4_fwd
  Relu()                                   (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_relu2_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_conv5_fwd
  Relu()                                   (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_relu3_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 512, 7, 7)      (1, 2048, 7, 7)     resnetv17_stage4_conv6_fwd
  Add()                                    (1, 2048, 7, 7)     (1, 2048, 7, 7)     resnetv17_stage4__plus1
  Relu()                                   (1, 2048, 7, 7)     (1, 2048, 7, 7)     resnetv17_stage4_activation1
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 2048, 7, 7)     (1, 512, 7, 7)      resnetv17_stage4_conv7_fwd
  Relu()                                   (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_relu4_fwd
  Conv(ker=3, st=1, pad=1, bias=True)      (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_conv8_fwd
  Relu()                                   (1, 512, 7, 7)      (1, 512, 7, 7)      resnetv17_stage4_relu5_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 512, 7, 7)      (1, 2048, 7, 7)     resnetv17_stage4_conv9_fwd
  Add()                                    (1, 2048, 7, 7)     (1, 2048, 7, 7)     resnetv17_stage4__plus2
  Relu()                                   (1, 2048, 7, 7)     (1, 2048, 7, 7)     resnetv17_stage4_activation2
  GlobalAveragePool()                      (1, 2048, 7, 7)     (1, 2048, 1, 1)     resnetv17_pool1_fwd
  Conv(ker=1, st=1, pad=0, bias=True)      (1, 2048, 1, 1)     (1, 1000)           resnetv17_dense0_fwd

Run consistency check of output size.
  -> No problem.

Allocating data on memory address(virtual) (1st).
done.
Start optimizing IR models.
  Set 3136[KB] for "work" element space.
done.
Reordering parameter for HW.
Allocating parameters on memory address(virtual).
done.
Start cycle estimation.
done.
Start writing parameter file for HW.
  Writing   3th Parameters.
  Writing   5th Parameters.
  Writing   6th Parameters.
  Writing   7th Parameters.
  Writing   8th Parameters.
  Writing  10th Parameters.
  Writing  11th Parameters.
  Writing  12th Parameters.
  Writing  14th Parameters.
  Writing  15th Parameters.
  Writing  16th Parameters.
  Writing  18th Parameters.
  Writing  19th Parameters.
  Writing  20th Parameters.
  Writing  21th Parameters.
  Writing  23th Parameters.
  Writing  24th Parameters.
  Writing  25th Parameters.
  Writing  27th Parameters.
  Writing  28th Parameters.
  Writing  29th Parameters.
  Writing  31th Parameters.
  Writing  32th Parameters.
  Writing  33th Parameters.
  Writing  35th Parameters.
  Writing  36th Parameters.
  Writing  37th Parameters.
  Writing  38th Parameters.
  Writing  40th Parameters.
  Writing  41th Parameters.
  Writing  42th Parameters.
  Writing  44th Parameters.
  Writing  45th Parameters.
  Writing  46th Parameters.
  Writing  48th Parameters.
  Writing  49th Parameters.
  Writing  50th Parameters.
  Writing  52th Parameters.
  Writing  53th Parameters.
  Writing  54th Parameters.
  Writing  56th Parameters.
  Writing  57th Parameters.
  Writing  58th Parameters.
  Writing  60th Parameters.
  Writing  61th Parameters.
  Writing  62th Parameters.
  Writing  63th Parameters.
  Writing  65th Parameters.
  Writing  66th Parameters.
  Writing  67th Parameters.
  Writing  69th Parameters.
  Writing  70th Parameters.
  Writing  71th Parameters.
  Writing  74th Parameters.
done.
[api-translator] finish
[converter for ai-mac] start
[Converter for ai-mac] finish
[converter for DRP] start
---------------------------------------------
[DRP converter] Start
  * Input file names
    -A ./output/test/test_tbl_addr_merge.txt
    -W ./output/test/test_tbl_addr_weight.txt
    -D ./output/test/test_tbl_addr_drp_config.txt
    -API ./output/test/test.json
    -AMAP ./output/test/test_addrmap_intm.yaml
    -OUT ./output/test
  * Start API.json File Analyze
  * Write DRP lib info(./output/test/drp_lib_info.txt)
[DRP converter] Success & Finished
[Generate address map file] Start
  > aimac_desc.bin size :   0x42e90 (274064 Byte)
  > drp_desc.bin size   :     0x1f0 (496 Byte)
  > drp_param.bin size  :     0x150 (336 Byte)

  [Address & data alignment check] PASS
  [Check address map overlap (memory leak)] PASS
  Address map file: ./output/test/test_addrmap_intm.yaml is generated.
[Generate address map file] Finish
[Make Input/Output node information]
  Input node list : ./output/test/test_data_in_list.txt is generated.
  Output node list : ./output/test/test_data_out_list.txt is generated.
---------------------------------------------
[Converter for DRP] Finish
```

## Reference
1. DRP-AI TVM: https://github.com/renesas-rz/rzv_drp-ai_tvm