# AWS Command Line Interface (CLI) Utility

## Background
+ The Amazon Web Services - aka AWS - is a set of cloud services hosted by Amazon
+ The AWS CLI is the AWS Command Line Interface utility, used to communicate with the AWS API backend via your command line

## Setup
### Pre-Requisites
### Dependencies
- [aws](https://github.com/aws/aws-cli)
  

## Documentation
### Synopsis/Syntax
```console
aws [service] [action]
```

### Parameters
- Positionals
    - service : Specify a target Amazon Web Services (AWS) service you wish to choose
        - Services
            - ec2 : The Amazon Elastic
                - Synopsis/Syntax
                    ```console
                    aws ec2 [action] {options} <arguments>
                    ```
                - Actions
                    - get-caller-identity : Retrieve the account number and your User ID
                        + Return Value Type: Dictionary/JSON/Hashmap
                    - run-instances : Launch an EC2 instance
                        - Synopsis/Syntax
                            ```console
                            aws ec2 run-instances {options} <arguments>
                            ```
                        - Options
                            + --count [count-size] : Specify number of counts; You can specify more than 1
                            + --image-id [AMI-ID] : Specify AMI ID
                            - --instance-type [type] : You can specify the instance type to create
                                - Instance types
                                    - Settings
                                        - c3 : C3
                                            + large : Large C3
                            + --key-name [name of key] : Specify Key-pair name
                            + --region [EC2-region] : Specify EC2 AMI region; i.e. 'us-east-1'
                            + --security-groups [group-name] : Specify security group names
            - sts : 
                - Synopsis/Syntax
                    ```console
                    aws sts [action] {options} <arguments>
                    ```
                - Actions
                    - describe-instances : Describes/Return a JSON information about the running EC2 instances
                        + Return Value Type: Dictionary/JSON/HashMap
- Optionals
    - With Arguments

    - Flags

### Usage
- To retrieve the account number and your user ID
    ```console
    aws sts get-caller-identity
    ```

- EC2 instances
    - To get information about the current EC2 instance
        ```console
        aws ec2 describe-instances
        ```

    - Launch an EC2 instance
        ```console
        aws ec2 run-instances --image-id ami-1a2b3c4d --count 1 --instance-type c3.large --key-name MyKeyPair --security-groups MySecurityGroup --region us-east-1
        ```

## Resources

## References
+ [Amazon AWS Docs - CLI latest reference](https://docs.aws.amazon.com/cli/latest/reference/)

## Remarks
