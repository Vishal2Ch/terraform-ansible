output "vm_public_ip" {
  description = "public ip of the gcp instance"
  value       = [ for vm in values(google_compute_instance.vm_instance) :
    vm.network_interface[0].access_config[0].nat_ip
    ]
}