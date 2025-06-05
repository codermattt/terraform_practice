terraform {
    backend "s3" {
        bucket         = "terraform23212"
        key            = "terraformFolder/storeTFstate" 
        region         = "us-east-1"      
    }
}