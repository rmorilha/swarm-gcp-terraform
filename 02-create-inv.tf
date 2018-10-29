resource "null_resource" "ansible-provision" {
  depends_on = ["google_compute_instance.gce-swarm-masters", "google_compute_instance.gce-swarm-members"]
 
  provisioner "local-exec" {
    command = "echo \"[swarm-master]\" >> swarm-inventory"
  }
 
  provisioner "local-exec" {
    command = "echo \"${join("\n",formatlist("%s ansible_ssh_user=%s", google_compute_instance.gce-swarm-masters.*.network_interface.0.access_config.0.assigned_nat_ip, var.ssh_user))}\" >> swarm-inventory"
  }
 
  provisioner "local-exec" {
    command = "echo \"[swarm-nodes]\" >> swarm-inventory"
  }
 
  provisioner "local-exec" {
    command = "echo \"${join("\n",formatlist("%s ansible_ssh_user=%s", google_compute_instance.gce-swarm-members.*.network_interface.0.access_config.0.assigned_nat_ip, var.ssh_user))}\" >> swarm-inventory"
  }

  provisioner "local-exec" {
    command = "echo \"[all:vars]\" >> swarm-inventory"
  }

  provisioner "local-exec" {
    command = "echo \"ansible_ssh_user=ubuntu\" >> swarm-inventory"
  }

  provisioner "local-exec" {
    command = "echo \"ansible_ssh_private_key_file=./keys/id_rsa\" >> swarm-inventory"
  }

}
