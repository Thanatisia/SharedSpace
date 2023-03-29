: "
Generate RSA SSL key and certificate using OpenSSL for your webservices

can also be reused for other SSL-related webservices like File Servers, Guacamole etc.

:: Documentation
### Synopsis/Syntax
    sudo ./gen_rsa [key_name] [certificate_name]

### Parameters
- Positionals
    - key_name : The name of your RSA-2048 X.509 Private key output
    - certificate_name : The name of your RSA-2048 X.509 certificate output

### Usage
- generate key and certificate
    sudo ./gen_rsa example_1.key example_1.crt
"

## File Variables
KEY_NAME="$1"
CERTIFICATE_NAME="$2"

## SSL Encryption variables
declare SSL_FLAGS=(
    # Start requesting for SSL Certification and key
    "req" 
    # Use the X.509 standard structure to encrypt
    "-x509"
    "-nodes"
    # Specify Time-to-live (TTL) - number of days before required to regenerate key for the webserver
    "-days 365"
    # Specify generate new key using 2048-bits RSA
    "-newkey rsa:2048"
    # Output RSA-Encrypted SSL PKE Certificate Private Key
    "-keyout $KEY_NAME"
    # Output RSA-Encrypted SSL PKE Certificate File
    "-out $CERTIFICATE_NAME"
)

generate_ssl()
{
    : "
    Generate SSL Certificate and Key using the SSL Flags specified
    "
    openssl ${SSL_FLAGS[@]}
}

main()
{
    argv=("$@")
    argc="${#argv[@]}"
    generate_ssl "$@"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
