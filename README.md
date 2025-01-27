Understanding Terraform Import

In modern cloud environments, infrastructure as code (IaC) tools like Terraform are essential for managing resources efficiently. Terraform allows you to define your infrastructure using code, which can be versioned, shared, and reused. However, what happens if you have existing infrastructure that was created manually or through another tool? This is where Terraform's import feature comes in.

What is Terraform Import?

The terraform import command is used to import existing resources into your Terraform state. This allows Terraform to manage resources that were not originally created by Terraform. Once imported, Terraform will track and manage the resource as if it had been created by Terraform itself.

How Terraform Import Works?

When you import a resource, Terraform doesn't automatically generate the configuration code in your .tf files. Instead, it updates the Terraform state file to include the existing resource, linking it to a specific resource block in your configuration.

Basic Example: Importing an Existing AWS EC2 Instance

Suppose you have an EC2 instance in AWS that you want to bring under Terraform management. The process would look like this:

Create an Empty Resource Block:

First, define an empty resource block in your configuration that matches the type of resource you want to import:

resource "aws_instance" "example" {
  # The arguments will be filled in after import
}


Import the Resource:

Use the terraform import command to import the resource into Terraform:

terraform import aws_instance.example i-1234567890abcdef0

Here, aws_instance.example is the resource block, and i-1234567890abcdef0 is the instance ID of your EC2 instance.

Update the Resource Block:

After importing, you need to update your resource block with the actual attributes of the EC2 instance:

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  tags = {
    Name = "ImportedInstance"
  }
}


Run terraform plan:

Running terraform plan should show that Terraform recognizes the existing resource and does not intend to make any changes unless your configuration is different from the current state.

Task: Importing an Existing VPC into Terraform
In this lab, you will import an existing AWS VPC into Terraform and manage it within your Terraform configuration.

Prerequisites

AWS CLI configured with access to your AWS account.

Steps:

Initialize a New Terraform Project

Start by creating a new directory for your Terraform project and navigating into it.

Identify the VPC to Import

Identify the AWS VPC you want to import. You can find the VPC ID in the AWS Management Console under the VPC section.

Write an Empty Resource Block

Create a main.tf file and define an empty resource block for the VPC you plan to import.

This block specifies the resource type (aws_vpc) and a name (imported_vpc) but does not include any attributes yet.

Then, initialize your Terraform project:
--terraform init

Import the VPC

Use the terraform import command to import the VPC into Terraform. Replace vpc-0b5b3c798d4abbfba with your VPC ID:

--terraform import aws_vpc.imported_vpc <VPC ID>

After running this command, Terraform will link the existing VPC to the imported_vpc block in your configuration. However, the main.tf file will not be updated automatically.

Inspect the State File

Use the terraform show command to inspect the state of the imported VPC:
--terraform show

This command will display all the attributes that Terraform has stored for the imported VPC.

Update the Resource Block

Update your main.tf file with the attributes that match the imported VPC. Here’s an example of what the updated main.tf file might look like:

Note: Ensure that the attributes in your configuration match the state exactly to avoid Terraform trying to recreate the VPC.

Run terraform plan

Run terraform plan to verify that Terraform recognizes the VPC as existing and that no changes are required:
--terraform plan

If your configuration matches the state, Terraform should indicate that no actions are necessary.

Apply the Configuration

Finally, apply the configuration with:
--terraform apply


Since the VPC already exists and is now fully under Terraform management, Terraform will make no changes, but any future changes to the VPC will be handled through Terraform.

Conclusion

You've now learned how to use Terraform's import functionality to bring existing infrastructure under Terraform management. By following the steps in this hands-on lab, you can effectively manage existing AWS resources using Terraform, ensuring that your infrastructure is consistent and reproducible.