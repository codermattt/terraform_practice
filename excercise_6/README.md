## About Project
- right now the .tfstate file is locally stored 
- everyone in the team should have the same copy of the .tfstate file
- So I cofigured an s3 bucket and created a folder to store the .tfsate file
- a backend.tf file was created with the s3 bucket details
- after "terraform init", then "terraform apply", terraform stores the tfstate file in the s3 bucket for shared-access in the team
