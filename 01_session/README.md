## 01_session
### Variables
- In this, we'll learn use of variables to make things more configurable.
- We'll configure instance type using a variable.
- This will help us update instance type at command line in programmatic ways.
- Variables when defined can be given default values, so that when no value is specified for them, they take the default values.
- Variables and their values can be defined in terraform.tfvars file separately.
- Also variable value can be specified as a flag at command line as per below commands,<br>
`terraform plan -var=instance_type="t2.micro"`<br>
`terraform apply -var=instance_type="t2.micro"`

### Output Values
- Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. 
- Output values are similar to return values in programming languages.

### Modules
- Modules are for convenience and can be included from terraform registry.
- These help to shorten terraform code. Without modules, it may take more lines of code to define our resouces.
