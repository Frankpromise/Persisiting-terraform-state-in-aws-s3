# Persisiting-terraform-state-in-aws-s3

![image](https://user-images.githubusercontent.com/99150197/167745730-a1cd18ce-dd88-4524-8237-927e1ba2ce8c.png)


To persist a terraform code in AWS s3, we will use the Docker Terraform provider to deploy an Nginx website container locally. One major thing to look out for in the terraform code we are going to use, is how we set up the backend which will store our state file remotely.

NOTE: Make sure you have docker already installed with your environment before you initialize the terraform backend.

STEPS:

Configure backend for setting up docker and remote storage backend.
Set up AWS CLI.
Set up docker provider with the docker image and container to be deployed.
Apply terraform.
View results.
Configure terraform provider

Terraform providers are plugins that implement resource types. Providers contain all the code needed to authenticate and connect to a service.

In our case, the terraform provider we will be using is the docker provider and the s3 backend provider.

NOTE: Our code will be split into three files. namely: backend.tf, main.tf, variable.tf.

Let’s start with the backend.tf file.

The code above contains the terraform block which helps to set different configuration options for Terraform. Here, we are using a required providers block within our terraform block, which helps us fetch the docker provider that we will be using to deploy our container. We are also making sure that the deployment will only work if the terraform version being used is greater or equal to version 0.13.

For the AWS s3 backend storage, we set up the profile for our AWS CLI, which in his case is called terraform_demo, the region, key name for the state file, and a name for the bucket.

Now, we have to pre exist our bucket because if we were to go ahead and initialize our code right now, it will return an error, because the bucke does not exist at the moment.

Set up aws cli

To set up aws cli, which will enable us create our s3 bucket, we will aws profile terraform_demo configure. Pass in your aws credentials which allows you o create an s3 bucket. Next, run aws- -terraform_demo s3 api create-bucket- -create-bucket myfirstbucket8990.

Define resources in main.tf file.

In the code above, we define the docker image, pass in the image name, which will pull down the image of a name Nginx, and then we use the Nginx image resource and reference it inside the docker container resource. We pass in a couple of ports so we can access our Nginx container both internally and externally. And finally, we define the output we want displayed when the deployment is successful.

This file declares a variable of type number, which contains our external port and the default port value. We also set up a validation block to make sure a number is always passed to this variable.

Now lets issue a terraform init.

The init command ensures that the right provider is pulled down from the public registry of terraform.

You can view a detailed explanantion here https://medium.com/@frankpromiseedah/persisiting-terraform-state-in-aws-s3-88fc7499c65

Then issue a terraform apply to deploy resources.
