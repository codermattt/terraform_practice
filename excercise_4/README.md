## About project
- The terraform code ssh's into the remote machine created
- Once inside it, it copies a Bash script file from the local machine folder into a folder in the remote machine
- The remote machine makes the script executable then executes the script, which deploys a static website
- I outputted the private ip of the instance into a local file, to check on my browser 
