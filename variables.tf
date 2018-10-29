##General vars
variable "ssh_user" {
  default = "ubuntu"
}
variable "public_key_path" {
  default = "./keys/id_rsa.pub"
}
variable "private_key_path" {
  default = "./keys/id_rsa"
}
##GCE Specific Vars
variable "gce_worker_count" {
  default = 2
}
variable "gce_master_count" {
  default = 1
}
variable "gce_creds_path" {
  default = "./keys/gce-creds.json"
}
variable "gce_project" {
  default = "jenkins-keep"
}
variable "gce_region" {
  default = "us-central1"
}
variable "gce_instance_size" {
  default = "n1-standard-1"
}
