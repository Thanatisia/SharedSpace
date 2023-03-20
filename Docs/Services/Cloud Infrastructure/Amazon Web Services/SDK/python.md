# AWS SDK for Python

## Background
+ The Amazon Web Services - aka AWS - is a set of cloud services hosted by Amazon
+ The AWS SDK for Python is the AWS Software Development Kit to be used to embed and run AWS communication code within your application to communicate with the AWS API backend

## Setup
### Pre-Requisites
- python3 is installed

### Dependencies
- [aws](https://github.com/aws/aws-cli)
- boto3 : Python library used with the AWS SDK

## Documentation

### Usage
- Importing library
    ```python
    import boto3
    ```

- Returning clients
    - Amazon EC2
        ```python
        ec2 = boto3.client("ec2", region_name="us-east-1")
        ```

## Wiki

### Namespaces/Packages
+ boto3

### Classes
- boto3
    - client(instance_name, options) : Initialize and get currently running clients
        - Parameters
            - Positionals
                - instance_name : Specify the client type
                    + Type: String
                    - Valid Values
                        + ec2 : Get EC2 clients
            - Options
                - region_name : Your server/region name; i.e. us-east-1
                    + Type: String
### Modules

## Resources

## References
+ [Amazon AWS SDK - Python Boto3 API documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

## Remarks