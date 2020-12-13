#!/bin/bash

function before_install_gprbuild() {
    sudo apt-get update
    sudo apt-get install gnat gprbuild
}

function script_build() {
    echo "Build cocount.gpr..."
    gprbuild -j0 -p
}