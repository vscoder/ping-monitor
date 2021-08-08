###
# VM
###
resource "yandex_compute_instance" "pingmon-vm" {
  name = "pingmon-vm"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      # centos-8
      #image_id = "fd878e3sgmosqaquvef5"
      # ubuntu-2004-lts
      image_id = "fd8vmcue7aajpmeo39kk"
      size = 5
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.pingmon-vm-data-disk.id
    auto_delete = true
    device_name = "data-disk"
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.pingmon-subnet.id
    nat       = true
  }

  metadata = {
    user-data = file("./cloud-config.yml")
  }
}

###
# Data disk
###
resource "yandex_compute_disk" "pingmon-vm-data-disk" {
  name = "pingmon-vm-data-disk"
  type = "network-hdd"
  zone = var.zone
  size = var.data_disk_size
}

###
# Network
###
resource "yandex_vpc_network" "pingmon-net" {
  name = "pingmon-net"
}

resource "yandex_vpc_subnet" "pingmon-subnet" {
  name           = "pingmon-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.pingmon-net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

###
# Output
###
output "internal_ip_address_pingmon_vm" {
  value = yandex_compute_instance.pingmon-vm.network_interface.0.ip_address
}

output "external_ip_address_pingmon_vm" {
  value = yandex_compute_instance.pingmon-vm.network_interface.0.nat_ip_address
}

output "ssh_connection_command" {
  value = "Wait about one minute and connect:\nssh -o 'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no' ansible@${yandex_compute_instance.pingmon-vm.network_interface.0.nat_ip_address}"
}
