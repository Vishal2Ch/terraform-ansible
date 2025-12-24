resource "google_compute_instance" "vm_instance" {
  for_each = tomap({
    "key-name-master"="ubuntu-2204-lts",
    "key-name-1"="ubuntu-2204-lts",
    "key-name-2"= "rhel-9",
    "key-name-3"= "debian-12",
  }) #meta argument
  name = "vishal-terra-created-gcp-vm-${each.key}"
  machine_type = "e2-micro"
  zone = var.zone
  #metadata_startup_script = file("${path.module}/install_nginx.sh")

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  network_interface {
  network    = var.vpc_name
  subnetwork = var.subnet_name
  access_config {}
}

  metadata = {
    ssh-keys = "${var.ssh_user}:${file("${path.module}/terra-ansible-key.pub")}"
  }

  tags = ["ssh"]
}
