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
      image_id = "fd878e3sgmosqaquvef5"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.pingmon-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
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
