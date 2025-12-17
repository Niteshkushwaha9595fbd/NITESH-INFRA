data "azurerm_subnet" "data1" {
    for_each = var.nic
    name                 = each.value.subnet_name
    virtual_network_name = each.value.vnet_name
    resource_group_name  = each.value.rg_name
  
}
data "azurerm_public_ip" "data1" {
  for_each = var.nic
    name                = each.value.public_ip_name
    resource_group_name = each.value.rg_name
  
}

resource "azurerm_network_interface" "example" {
    for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "${each.value.nic_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.data1[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.data1[each.key].id
  }
   tags = var.tags
}