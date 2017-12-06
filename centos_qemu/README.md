# terraform + libvirt + CentOS7

## Packer template notes

The packer template comes from [kaorimatz/packer-templates](https://github.com/kaorimatz/packer-templates).

Changes:
-   `repo.sh` was pointing at an old url
-   username/pw changed to centos
-   added packages
    -   wget
-   removed all non qemu builders and provisioners

### Step 1) Build a raw qemu image

-   run packer
    ```sh
    ./build.sh
    ```

### Step 2) Test the qemu image

-   boot the image
    ```sh
    ./boot.sh
    ```

-   login with username and password `centos`
    ```sh
    ssh -p22222 centos@localhost
    ```
