# Documentation - Command : Curl

## Table of Contents
* [Background](#background)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Background

curl is a tool used to transfer data to and from a server using one of the supported protocols (HTTP, HTTPS, FTP, FTPS, GOPHER, DICT, TELNET, LDAP or FILE).

This command is designed to work without user interaction

## Documentation

### Syntax

curl {options} <arguments> [url]

### Parameters
```
Note: This is still being consolidated
```
* -f | --fail : Fail silently (no output if errors detected)
* -L | --location : (HTTP/HTTPS) Flag will let curl attempt to re-attempt the get from a different location if the server reports that the requested page has a different location.
	- When used alongside '-i|--include' or '-I|--head", headers from all requested pages will be shown
* -o | --output <filename> : Write output to <filename> instead of stdout. 
	- If you are using {} or [] to fetch multiple documents, you can use '#' followed by a number in the <file> specifier. That variable will be replaced with the current string for the URL being fetched.
	- Example: 
		* Fetch multiple documents : curl http://{one,two}.site.com -o "file_#1.txt" 
		* Several Variables : curl http://{site,host}.host[1-5].com -o "#1_#2" 
* -O | --remote name : Write output to a local file named like the target remote file
	- Repeatable for every URL you used

### Usage

Download from a server (without fail) : curl -fLo "<output-file-name>" {url-to-repository-file}

## Remarks

### Thanks to the following for references

* Background : [MIT curl documentation](https://www.mit.edu/afs.new/sipb/user/ssen/src/curl-7.11.1/docs/curl.html)