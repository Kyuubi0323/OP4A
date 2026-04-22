
## About the allwinner model zoo
```shell
tar -xvf allwinner-model-zoo.tar.gz
cd awnpu_model_zoo-v0.9.0-20260116-83a67d4b
sudo docker run --ipc=host -d -v ${PWD}:/workspace --name model-zoo ubuntu-npu:v1.8.11 tail -f /dev/null
```

## From our x86 machine, activate the virtual environment
```shell
python -m venv .venv && source .venv/bin/activate
pip install ultralytics
```
## Export onnx model 
```shell
cd yolo11/convert_model/python
yolo export model=yolo11s.pt format=onnx imgsz=640 simplify=True dynamic=False opset=11 nms=False batch=1 device=cpu
```

## Prune model

```shell
python onnx_extract.py
mv yolo11s_6.onnx ../
cd ../
```

## Create symlink for conversion scripts
```shell
./convert_model_env.sh
```

## Model Import/Quantization/Conversion
```shell
bash ../../../../scripts/modelzoo.sh 
```

```docker
cd /workspace/examples/yolo11/convert_model/
./pegasus_import.sh yolo11s_6
./pegasus_quantize.sh yolo11s_6 uint8 12
./pegasus_export_ovx_nbg.sh yolo11s_6 uint8 t527
```

## Compile the example
```shell
#exit the docker
exit
cd ../../../3rdparty/opencv/
unzip opencv-4.9.0-aarch64-linux-sunxi-glibc.
cd ../../../toolchain/
tar -xvf gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz
# Move that toolchain to the 0-toolchain before compile
mv gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu ../awnpu_model_zoo-v0.9.0-20260116-83a67d4b/0-toolchains/
cd ../awnpu_model_zoo-v0.9.0-20260116-83a67d4b/0-toolchains/
```

```
cd ../examples/yolo11/
../build_linux.sh -t t527 -s debian11
```