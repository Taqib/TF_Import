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