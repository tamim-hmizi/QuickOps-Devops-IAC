resource "azurestack_virtual_network" "vnet" {
  name                = "devops-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurestack_network_security_group" "vm_nsg" {
  name                = "devops-vm-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurestack_subnet" "subnet" {
  name                 = "devops-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurestack_virtual_network.vnet.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurestack_subnet" "aks_subnet" {
  name                 = "devops-aks-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurestack_virtual_network.vnet.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurestack_subnet" "aks_agents_subnet" {
  name                 = "devops-aks-agents-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurestack_virtual_network.vnet.name
  address_prefix       = "10.0.3.0/24"
}


resource "azurestack_public_ip" "public_ip" {
  name                = "devops-vm-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}



