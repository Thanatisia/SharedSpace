# Java JDK Binary and Packages : keytool

## Information
### Application
+ Name: keytool

### Background
+ This is a CLI utility used to generate a Private-Public Key Pair and Digital Certificates in a Keystore file used to sign the APK file
- Key Generation
    - The tool will prompt you afew questions required to create your Public Key Encryption (PKE)-generated key pair and the Digital Signature

## Setup
### Dependencies
+ Java-JDK

### Pre-Requisites

## Documentations
### Synopsis/Syntax

### Parameters
+ -genkey : Generate Public-Private Key Pair
+ -v : Enable verbose message output
+ `-keystore [keystore-file-name]` : Specify the output keystore file name to generate; This will contain the Private Key and Digital Certificate (Signature) used to sign the APK file
- `-keyalg [key-generation-algorithm]` : Specify the private key encryption algorithm used to generate the Public-Private Key Pair
    - Algorithms
        + RSA
- `-keysize [key-size (bits)]` : Specify the size (number of bits) of the key pair
    - Key Sizes
        + 2048 : 2048-bits
- `validity [number-of-days]` : Specify the 'Time-to-Live' (aka Lifetime) of the key before the key expires and has to be re-generated
- `-alias [your-alias]` : Specify the Alias for your key

### Usage
- Generate a simple Keystore file with an RSA-2048 Private-Public Key Pair and Digital Certificate that will last for 10,000 days
    ```console
    keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-alias
    ```

## Wiki

## Resources

## References

## Remarks

