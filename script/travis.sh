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

INSTALL_DIR=$PWD/../gnat
ROOT=$PWD
export PATH=$INSTALL_DIR/bin:$PATH
export ADA_PROJECT_PATH=$PWD/libadalang-tools/src:$PWD/VSS/gnat:$PWD/ada_libfswatch/:$PWD/subprojects/stubs

function download_gnat()
{
    if [ ! -f $GNAT_INSTALLER ]; then
        mkdir -p `dirname $GNAT_INSTALLER`
        rm -rfv `dirname $GNAT_INSTALLER`/*
        # Use --progress=dot:giga to ensure travis doesn't give up for lack of progress
        wget --progress=dot:giga -O $GNAT_INSTALLER $1
    fi

    git clone https://github.com/AdaCore/gnat_community_install_script.git
    sh gnat_community_install_script/install_package.sh $GNAT_INSTALLER $INSTALL_DIR
    $INSTALL_DIR/bin/gprinstall --uninstall gnatcoll
}


function linux_before_install()
{
    echo INSTALL_DIR=$INSTALL_DIR
    GNAT_INSTALLER=$HOME/cache/gnat-2020-20200818-x86_64-linux-bin

    download_gnat https://community.download.adacore.com/v1/a639696a9fd3bdf0be21376cc2dc3129323cbe42\
?filename=gnat-2020-20200818-x86_64-linux-bin

    wget -nv -O- https://dl.bintray.com/reznikmm/libadalang/libadalang-stable-linux.tar.gz \
        | tar xzf - -C $INSTALL_DIR
    clone_dependencies
    build_libfswatch
    sudo apt-get update
    sudo apt-get -y install chrpath
}
