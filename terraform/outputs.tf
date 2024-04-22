output "resource_group_name" {
    description = "The name of the created resource group."
    value       = module.azure_vnet.resource_group_name
}

output "virtual_network_name" {
    description = "The name of the created virtual network."
    value       = module.azure_vnet.virtual_network_name
}

output "subnet_name" {
    description = "The name of the created subnet 1."
    value       = module.azure_vnet.subnet_name
}
