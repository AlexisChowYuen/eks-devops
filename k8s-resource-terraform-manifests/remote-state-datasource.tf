data "terraform_remote_state" "eks" {
    backend = "local"
    config = {
        path = "../ekscluster-terraform-manifests/terraform.tfstate"
    }
}