output "gcp_vm_public_ips" {
  value = [
    for instance in google_compute_instance.vm_instance : {
      name      = instance.name
      public_ip = instance.network_interface[0].access_config[0].nat_ip
    }
  ]
}