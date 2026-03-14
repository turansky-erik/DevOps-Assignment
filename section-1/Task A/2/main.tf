provider "aws" {
	region = var.var_region
	access_key = var.var_access_key
	secret_key = var.var_secret_key
}


module "test_module-1" {

source = ".//module-1"
}
