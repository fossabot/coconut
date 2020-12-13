#!/bin/bash

# target_dir=/usr/local
# install_dir=gtkada_tmp
# build_dir=bootstrap

# download_xmlada() {
#     echo "正在下载安装[xmlada]..."
#     wget --nv -O- https://github.com/AdaCore/xmlada/archive/xmlada-16.1.tar.gz | tar zxf - -C xmlada-16.1.tar.gz
# }

# download_gprbuild() {
#     echo "正在下载[gprbuild]..."
#     wget --nv -O- https://github.com/AdaCore/gprbuild/archive/community-2019.tar.gz | tar zxf - -C community-2019.tar.gz
# }

# build_gprbuild() {
#     echo "正在编译[gprbuild]..."
#     ./bootstrap.sh --with-xmlada=../xmlada-xmlada-16.1 --prefix=./$build_dir
# }

# install() {
#     mkdir $install_dir
#     cd $install_dir
#     download_xmlada
#     download_gprbuild

#     cd gprbuild-community-2019
#     build_gprbuild

#     echo "安装在[" $target_dir "]"
#     cp $build_dir/bin/* $target_dir/bin/

#     cp -R $build_dir/share/gpr $target_dir/share/
# 	cp -R $build_dir/share/gprconfig/ $target_dir/share/

# 	cp -R $build_dir/libexec/gprbuild/ $target_dir/libexec/
# }

# script() {
#     gprbuild -j0 -p
# }


set -e -x

INSTALL_DIR=$PWD/../gprbuild_temp
#export PATH=$INSTALL_DIR/bin:$PATH

function download_xmlada()
{
    wget -nv -O- https://github.com/AdaCore/xmlada/archive/xmlada-16.1.tar.gz
    tar xzf - -C xmlada-16.1.tar.gz
}

function download_gprbuild()
{
   
    wget -nv -O- https://github.com/AdaCore/gprbuild/archive/community-2019.tar.gz
    tar xzf - -C community-2019.tar.gz
}

function install()
{
    
    mkdir $INSTALL_DIR
    
    cd $INSTALL_DIR
    
    download_xmlada
    download_gprbuild

    cd gprbuild-community-2019
    $ ./bootstrap.sh --with-xmlada=../xmlada --with-kb=../gprconfig_kb --prefix=./bootstrap

}