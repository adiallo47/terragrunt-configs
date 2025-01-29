terraform{
    source = "git::https://github.com/adiallo47/terraform-modules.git//modules/ec2?ref=main"
}
inputs = {
    region = "us-east-1"
    myec2 = "t2.micro"
    name = "Terragrunt EC2 Instance"  
    ami = "ami-04b4f1a9cf54c11d0"
}

remote_state {
    backend = "s3"
    config = {
        bucket = "tf-dou-s3bucketec2-backup"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "table"
        key = "stage/s3/practice"
    }
}