locals {
    owners = var.business_division
    environment = var.environment
    name = "${var.business_division}-${var.environment}"
    
    comment_tags = {
        owners = local.owners
        environment = local.environment
    }
}