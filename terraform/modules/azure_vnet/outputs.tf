output "resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  description = "The name of the created virtual network."
  value       = azurerm_virtual_network.manul_network.name
}

output "subnet_name" {
  description = "The name of the created subnet"
  value       = azurerm_subnet.manul_subnet.name
}
