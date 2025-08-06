location         = "East US 2"
agent_version    = "4.259.0"
agent_filename   = "vsts-agent-linux-x64-4.259.0.tar.gz"
vm_admin_username = "VmSelfHostAdmin"
vm_admin_password = "!VmSelfHostAdmin@"

tags = {
  data_classification = "internal"
  managed_by          = "terraform"
  technical_contact   = "marcelo.projects.dev@gmail.com"
}

# security_rules = [
#   {
#     name                       = "AllowSSH"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   },
#   {
#     name                       = "DenyAllOutbound"
#     priority                   = 4096
#     direction                  = "Outbound"
#     access                     = "Deny"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# ]
