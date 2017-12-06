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

## Step 3) Install Terraform libvirt provider

-   [dmacvicar/terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

    ```sh
    go get github.com/dmacvicar/terraform-provider-libvirt
    cd $GOPATH/src/github.com/dmacvicar/terraform-provider-libvirt/
    go install
    ```

-   Add provider to terraform environment

    ```sh
    cd infrastructure_management/terraform/qemu
    mkdir -p terraform.d/plugins/linux_amd64
    cp ~/.go/bin/terraform-provider-libvirt terraform.d/plugins/linux_amd64/
    ```

### Step 4) run Terraform

**UNDER CONSTRUCTION**

What works:
-   volume based on raw image type

What does not work yet:
-   bridge network gets created but no ip is assigned to guest

After finishing this step, your new instance should be visible in `virt-manager`

-   Initialize [Terraform](https://www.terraform.io/downloads.html) (first time only):

    ```sh
    terraform init
    ```

-   Try to plan with [Terraform](https://www.terraform.io/downloads.html).

    ```sh
    terraform plan -out tfplan
    ```

-   If the plan output looks safe, apply it

    ```sh
    terraform apply tfplan
    ```

-   Delete the old plan, *do not use it again*

    ```sh
    rm tfplan
    ```
