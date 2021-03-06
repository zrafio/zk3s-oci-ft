module "free-tier-k3s" {
  source = "./modules/free-tier-k3s"

  # General
  project_name   = "Zk3s"
  region         = var.region
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaawpshfykz5jkgfj7hbxnqbrwttldpvhlhjiwu2ubrd6gxr364iomq"
  ssh_public_key = file("~/.oci/sessions/kubernetes/oci_api_key_public.pem")
# ssh_public_key = file("~/.oci/ssh_key_public.pem")

  # Network
  whitelist_subnets = [
    "0.0.0.0/0",
    "10.0.0.0/16"
  ]

  vcn_subnet     = "10.0.0.0/16"
  private_subnet = "10.0.2.0/23"
  public_subnet  = "10.0.0.0/23"

  freetier_server_ad_list = 3
  freetier_worker_ad_list = [ 1 ]
# freetier_worker_ad_list = [ 1, 2, 3 ]
}