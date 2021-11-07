#!/bin/sh
export OSLAB_INSTALL_PATH=$HOME

install_gcc34() {
    if [ -z `which gcc-3.4` ]; then   #如果搜索到gcc-3.4的可执行文件目录不存在
        tar zvxf gcc-3.4-ubuntu.tar.gz -C /tmp    #则安装gcc-3.4
        cd /tmp/gcc-3.4
        sudo ./inst.sh amd64
        cd -
    fi
}
install_dep_i386() {    #安装需要的32位依赖文件
    # Install bin86
    sudo apt-get install bin86
    # Install 32bit libs
    sudo apt-get install libc6-dev-i386
    # Install compilation environment for C
    sudo apt-get install build-essential
    # Install libSM:i386 for bochs
    sudo apt-get install libsm6:i386
    # Install libX11-6:i386 for bochs
    sudo apt-get install libx11-6:i386
    # Install libxpm4:i386 for bochs
    sudo apt-get install libxpm4:i386
}

# Extract linux-0.11 and bochs and hdc image
tar zxf hit-oslab-linux-qiuyu.tar.gz -C $OSLAB_INSTALL_PATH

# Extract and Install gcc-3.4
install_gcc34

#Install x86(i386) dependencies for x86_64(amd64) arch
install_dep_i386

