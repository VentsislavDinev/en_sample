module "continer_group" {
    source = ".//containers-dev/container group"

}
module "container_registry" {
    source = ".//containers-dev/container registry"

}
module "kubernetes_cluster" {
    source = ".//containers-dev/kubernetes cluster"

}
module "kubernetes_cluster_node_pool" {
    source = ".//containers-dev/kubernetes cluster node pool"


}
module "registry_webhook" {
    source = ".//containers-dev/registry webhook"

}
module "insight" {
    source = ".//application-insight/insight"  

}
module "configuration" {
    source = ".//db/configuration"

}
module "database" {
    source = ".//db/database"

}
module "firewall_rule" {
    source = ".//db/firewall_rule"

}
module "server" {
    source = ".//db/server"

}
module "virtual_network_rule" {
    source = ".//db/virtual network rule"

}
module "cname_records" {
    source = ".//dns/cname_record"

}
module "txt_record" {
    source = ".//dns/txt_record"

}
module "key_vault_access_policy" {
    source = ".//key-vault/key_vault_access_policy"

}
module "key_vault" {
    source = ".//key-vault/key_vault"

}
module "key_vault_key" {
    source = ".//key-vault/key_vault_key"

}
module "backend_address_pool" {
    source = ".//loadbalance/backend address pool"

}
module "backend_address_pool_address" {
    source = ".//loadbalance/BackAddressAddress"

}
module "load_balance" {
    source = ".//loadbalance/lb"

}
module "nat_pool" {
    source = ".//loadbalance/nat pool"

}
module "nat_rule" {
    source = ".//loadbalance/nat rule"

}
module "probe" {
    source = ".//loadbalance/probe"

}
module "rule" {
    source = ".//loadbalance/rule"

}
module "eventhub" {
    source = ".//messaging/eventhub"

}

module "action_group" {
    source = ".//monitoring/action group"

}
module "action_rule_action_group" {
    source = ".//monitoring/action rule action group"

}
module "action_rule_suppression" {
    source = ".//monitoring/rulesuppression"

}
module "autoscale_setting" {
    source = ".//monitoring/autoscale setting"

}
module "diagnostic_setting" {
    source = ".//monitoring/diagnostic setting"

}
module "metric_alert" {
    source = ".//monitoring/metric alert"

}
module "monitor_log_profile" {
    source = ".//monitoring/monitor log profile"

}
module "scheduled_query_rules_alert" {
    source = ".//monitoring/scheduled query rules alert"

}
module "scheduled_query_rules_log" {
    source = ".//monitoring/scheduled query rules alert"

}
module "smart_detector_alert_rule" {
    source = ".//monitoring/smart detector alert rule"

}
module "network_interface" {
    source = ".//network/network_interface"

}
module "public_ip" {
    source = ".//network/public_ip"

}
module "subnet" {
    source = ".//network/subnet"

}
module "virtual_network" {
    source = ".//network/virtual_network"

}
module "resource_group" {
    source = ".//resource-group/container group"

}
module "account" {
    source = ".//storage/account"

}
module "storage_container" {
    source = ".//storage/storage_container"

}

module "active_slot" {
    source = ".//webserver-stage/active slot"

}
module "certificate" {
    source = ".//webserver-stage/certificate"

}
module "certificate_binding" {
    source = ".//webserver-stage/certificate binding"

}
module "certificate_order" {
    source = ".//webserver-stage/certificate order"

}
module "environment" {
    source = ".//webserver-stage/environment"

}
module "function_app_slot" {
    source = ".//webserver-stage/function app slot"

}
module "function_app" {
    source = ".//webserver-stage/function_app"

}
module "service_hybrid_connection" {
    source = ".//webserver-stage/service hybrid connection"

}
module "service_managed_certificate" {
    source = ".//webserver-stage/service managed certificate"

}
module "service_plan" {
    source = ".//webserver-stage/service plan"

}
module "service_slot" {
    source = ".//webserver-stage/service slot"

}
module "service_virtual_network_swift_connection" {
    source = ".//webserver-stage/service virtual network swift connection"

}
module "slot_virtual_network_swift_connection" {
    source = ".//webserver-stage/slot virtual network swift connection"

}
module "source_control_token" {
    source = ".//webserver-stage/control token"

}
module "availability_set" {
    source = ".//vm-dev/availability_set"

}
module "data_disk_attachment" {
    source = ".//vm-dev/data disk attachment"

}
module "dedicated_host" {
    source = ".//vm-dev/dedicated host"

}
module "dedicated_host_group" {
    source = ".//vm-dev/dedicated host group"

}
module "extension" {
    source = ".//vm-dev/extension"

}
module "image" {
    source = ".//vm-dev/image"

}
module "linux_virtual_machine" {
    source = ".//vm-dev/linux virtual machine"

}
module "linux_virtual_machne_scale_set" {
    source = ".//vm-dev/linux VM scale set"

}
module "machine_scale_set" {
    source = ".//vm-dev/machine scale set"

}
module "machine_scale_set_extension" {
    source = ".//vm-dev/machine scale set extension"

}
module "managed_disk" {
    source = ".//vm-dev/managed disk"

}
module "marketplace_agreement" {
    source = ".//vm-dev/marketplace agreement"

}
module "orchestrated_virtual_machine_scale_set" {
    source = ".//vm-dev/orchestrated virtual machine scale set"

}
module "proximity_placement_group" {
    source = ".//vm-dev/proximity placement group"

}
module "shared_image_gallery" {
    source = ".//vm-dev/shared image gallery"

}
module "shared_image_version" {
    source = ".//vm-dev/shared image version"

}
module "shared_image" {
    source = ".//vm-dev/shared_image"

}
module "snapshot" {
    source = ".//vm-dev/snapshot"

}
module "ssh_public_key" {
    source = ".//vm-dev/ssh public key"

}
module "virtual_machine" {
    source = ".//vm-dev/virtual machine"

}
module "windows_virtual_machine" {
    source = ".//vm-dev/windows virtual machine"

}
module "windows_virtual_machine_scale_set" {
    source = ".//vm-dev/windows virtual machine scale set"

}