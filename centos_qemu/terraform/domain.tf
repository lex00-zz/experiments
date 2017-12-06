resource "libvirt_network" "tf" {
   name = "tf"
   domain = "tf.local"
   mode = "bridge"
   bridge = "br1"
   addresses = ["10.0.100.0/24"]
}

resource "libvirt_volume" "qemu_centos7" {
  name = "qemu_centos7"
  format = "raw"
  source = "../packer/output-centos-7.4-x86_64-qemu/packer-centos-7.4-x86_64"
}

resource "libvirt_volume" "vol_qemu_centos7" {
  name = "vol_qemu_centos7"
  base_volume_id = "${libvirt_volume.qemu_centos7.id}"
}

resource "libvirt_domain" "qemu_centos7" {
  count = 1
  name = "qemu_centos7"
  memory = "${var.qemu_memory}"
  vcpu = "${var.qemu_cpus}"

  depends_on = ["libvirt_volume.qemu_centos7", "libvirt_network.tf"]

  network_interface {
      bridge = "br1"
      network_name = "tf"
      mac = "00:00:00:00:00:01"
  }

  disk {
       volume_id = "${libvirt_volume.vol_qemu_centos7.id}"
       type = "raw"
  }
}
