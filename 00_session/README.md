## 00_session
- In this session, we'll create a single EC2 instance.
- We'll learn about providers, specifying configuration for providers, terraform commands like init, fmt, validate, plan, apply, destroy.
- Then we'll try to update the instance type from t2.micro to t2.nano, and run terraform to check idempotence, which is it won't create an additional resource of ne instance type but update the existing one. Idempotence means that it will create the same result/infra defined in the files, no matter how many times we run the files.
