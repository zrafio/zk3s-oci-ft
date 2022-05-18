module "free-tier-k3s" {
  source = "./modules/free-tier-k3s"

  # General
  project_name   = "Zk3s"
  region         = var.region
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaosin6cslh5dmdciafyrc3uymw42bv7454j6j6mlnwi2spbx54jga"
  ssh_public_key = file("~/.oci/zrafio_2022-05-17T22 47 48.949Z_public.pem")

  # Network
  whitelist_subnets = [
    "0.0.0.0/0",
    "10.0.0.0/16"
  ]

  vcn_subnet     = "10.0.0.0/16"
  private_subnet = "10.0.2.0/23"
  public_subnet  = "10.0.0.0/23"

  freetier_server_ad_list = 3
  freetier_worker_ad_list = [ 1, 2, 3 ]
}