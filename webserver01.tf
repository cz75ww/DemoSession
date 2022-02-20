module "acceptance-linux-vm" {
  source            = "./modules/acceptance-ubuntu-vm"
  vpc_name          = "DemoSessionVPC"
  server_tag_name   = "Demosession"
  region            = "us-east-1"
  cidr_vpc          = "10.1.0.0/16"
  cidr_subnet       = "10.1.0.0/24"
  ssh_user          = "ubuntu"
  internet_access   = "0.0.0.0/0"
  aws_key_name      = "<aws key name>"
  aws_key_path      = "<aws key path>"
  ansible_acc_path  = "./modules/acceptance-ubuntu-vm/ansible/custom_tasks.yaml"
  ingress_ports     = [22, 80, 8080]
}
