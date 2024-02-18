# Linux command - zip

## Information

## Summary
### Dependencies
### Pre-Requisites

## Documentations
### Synopsis/Syntax
```console
zip {options} [output-zip-file] [input-files]
```

### Parameters
- Positionals
    + output-zip-file : Specify the filename of the output zip archive
    + input-files     : Specfiy the files you want to archive; Separate all files with a space-delimiter
- Optionals
    - With Arguments
        + `--password [your-password-here]` : Specify the password you want to encrypt the output zip file with
    - Flags
        + -d : Delete/Remove specified files from the archive
        + -u : Update the specified list of files in an existing archive to update/add to the archive

### Usage
- Password-protect (encrypt) a zip file 
    ```console
    zip --password [your-password-here] [output-zip-file] [input-files]
    ```

## Wiki

## Resources

## References
+ [GeeksforGeeks - Linux - zip command](https://www.geeksforgeeks.org/zip-command-in-linux-with-examples/)

## Remarks

