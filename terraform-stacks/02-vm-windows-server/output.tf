output "vm_public_ip" {
  description = "Public IP attached to the VM"
  value       = azurerm_windows_virtual_machine.vm01.public_ip_address
}