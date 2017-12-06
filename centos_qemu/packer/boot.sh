#!/bin/bash
cd output-centos-7.4-x86_64-qemu
qemu-system-x86_64 -drive file=packer-centos-7.4-x86_64,format=raw \
-m 2048 \
-net user,hostfwd=tcp::22222-:22 \
-net nic  \
-machine accel=kvm \
#-nographic \

