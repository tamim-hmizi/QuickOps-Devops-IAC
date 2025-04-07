output "subnet_id" {
  value = module.network.subnet_id
}

output "aks_subnet_id" {
  value = module.network.aks_subnet_id
}

output "public_ip_id" {
  value = module.network.public_ip_id
}

output "public_ip" {
  value = module.network.public_ip
}

output "vm_private_ip" {
  value = module.vm.vm_private_ip
}


