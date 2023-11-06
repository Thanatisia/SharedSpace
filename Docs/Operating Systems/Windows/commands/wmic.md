# Windows command: wmic

## Basics
+ The 'wmic' is the Windows Management Instrumentation (WMI) CLI application/utility.

## Documentation
### Synopsis/Syntax
```console
wmic [queries] {options} <arguments>
```

### Parameters
- Positionals
    - Queries
        - `baseboard [action] <keyword,...>` : Get values of a specified motherboard option; Separate each keyword with a comma (',') delimiiter
            - Action
                - get : Return information of the specified keyword
                    - Keywords
                        + product : Get the product specification of the motherboard
                        + Manufacturer : Get the manufacturer of the motherboard
        - `path [key] get [value]` : Query details from the Registry Keys and Nodes and return information
            - Keys
                - softwarelicensingservice : Software Licensing Key-related configuration values
                    - Values
                        + OA3xOriginalProductKey : Windows Product Key
        + cpu  : Return information on the local CPU
- Optionals

### Usage
- Get Product Key programatically
    + Registry Key: SoftwareLicensing
    ```console
    wmic path softwarelicensingservice get OA3xOriginalProductKey
    ```

- Get Motherboard specifications
    - Product
        ```console
        wmic baseboard get product
        ```
    - Manufacturer
        ```console
        wmic baseboard get Manufacturer
        ```

## Resources

## References
+ [FreeCodeCamp - News - How to find a windows 10 product key](https://www.freecodecamp.org/news/how-to-find-a-windows-10-product-key/)

## Remarks
