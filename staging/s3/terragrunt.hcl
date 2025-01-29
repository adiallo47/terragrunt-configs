terraform{
    source = "git::https://github.com/adiallo47/terraform-modules.git//modules/s3?ref=main"
}

inputs = {
    s3bucket = "tf-dou-s3bucket"
    region = "us-east-1"
    sse_algorithm  = "AES256"          
    acl            = "private"
    name           = "Terraform practice" 
}

remote_state {
    backend = "s3"
    config = {
        bucket = "tf-dou-s3bucket-backup"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "table"
        key = "stage/s3/practice"
    }
}