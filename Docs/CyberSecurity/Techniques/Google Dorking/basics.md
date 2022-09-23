# Google Dorking Basics

## Information

### DESCRIPTION
```
Google Dorking is the traditional but powerful and useful Technique/tool for Reconnaissance/Information Gathering
using Google's Advanced Search keywords and operators to filter out Open Source Information. 

Google Dorking is generally considered as an OSINT (Open Source Intelligence) technique
```

## Setup
### Pre-Requisite
- In Google
	+ Open "Advanced Search" (Preferably)


## Documentations
### Keywords
+ AND : Logical AND condition
+ OR : Logical OR condition

### Operators
+ filetype:[filetype] : Google will restrict the results to sepcified file types
    - Example:
        + email security filetype:pdf
        + email security filetype:pdf OR cloud filetype:pdf
+ allintext:[keywords ...] : Google will restrict the results to thos containing all the texts specified
    - Example:
        + allintext: healthy eating
+ allinurl:[keywords ...] : Google will restrict the results to pages whose URLs contain all the texts specified
    - Example:
        + allinurl: websecurity
+ cache:[url] : Google will display the cached version of the queries URL
    - Example:
        + cache:www.example.com
+ related:[url] : google will display pages that are similar (related to) the queries URL
    - Example:
        + related:www.example.com
+ link:[url] : Google will display pages that points to the queries URL
    - Example:
        + links:www.example.com

## Resources
+ [SecurityTrails - Google Hacking Techniques](https://securitytrails.com/blog/google‐hacking‐techniques)

## References

## Remarks
