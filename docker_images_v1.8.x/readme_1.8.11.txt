此镜像集成了模型转换工具与cmake编译工具开发环境；

注意：
镜像运行的容器只当开发环境，代码还是放在本地linux机器的目录，docker容器通过文件挂载的方式访问。


更新记录：
npu_v1.8.11版本：
aarch64 xx527平台的适配；
acuity工具版本: v6.21.16
IDE版本: v5.8.2


更新whl版本，拓展softmax 能支持的输入shape，scatterND算子转换报错问题处理；


其中：
模型转换工具路径：
export ACUITY_PATH=~/acuity-toolkit-whl-x.x.x/bin

交叉编译工具链在 board-demo/0-toolchains 目录：
aarch64平台使用参考：
set(CMAKE_C_COMPILER "${CMAKE_SOURCE_DIR}/../0-toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "${CMAKE_SOURCE_DIR}/../0-toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-g++")




