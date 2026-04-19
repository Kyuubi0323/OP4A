
# Toolchain4OP

## Install dependencies

sudo apt install gcc-arm-linux-gnueabihf make ncurses-dev
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
git submodule update --init --recursive

## Building uboot 
```
git clone https://github.com/orangepi-xunlong/u-boot-orangepi.git -b v2018.05-t527-v1.2
cd u-boot-orangepi
make sun55iw3p1_t527_defconfig
make CROSS_COMPILE=aarch64-linux-gnueabi- CFLAGS="-Wno-error"  -j$(nproc)
```
## Building kernel
```
#Firstly, install the missing toolchain(idk, but, they could have been upgrade the version of gcc)

cd orangepi-build/toolchains/
wget https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
tar xf gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz

```