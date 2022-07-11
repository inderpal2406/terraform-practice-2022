## 01_session
- In this, we'll learn use of variables to make things more configurable.
- We'll configure instance type using a variable.
- This will help us update instance type at command line in programmatic ways.
- Variables when defined can be given default values, so that when no value is specified for them, they take the default values.
- Variables and their values can be defined in terraform.tfvars file separately.
- Also variable value can be specified as a flag at command line as per below commands,
`terraform plan -var=instance_type="t2.micro"`
`terraform apply -var=instance_type="t2.micro"`
