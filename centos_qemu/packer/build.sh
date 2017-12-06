#!/bin/bash
PACKER_CACHE_DIR=~/.packer packer build -only=qemu -var compression_level=0 -var disk_size=4000 centos-7.4-x86_64.json
