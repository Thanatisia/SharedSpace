# Windows command: wmic

## Basics
+ The 'wmic' is the Windows Management Instrumentation (WMI) CLI application/utility.

## Documentation
### Synopsis/Syntax
```console
wmic [queries] {options} <arguments>
```

### Parameters
- queries
    + path [key] get [value] : Query details from the Registry Keys and Nodes and return information
    + cpu  : Return information on the local CPU
- Optionals

### Usage
- Get Product Key programatically
    + Registry Key: SoftwareLicensing
    ```console
    wmic path softwarelicensingservice get OA3xOriginalProductKey
    ```

## Resources

## References
+ [FreeCodeCamp - News - How to find a windows 10 product key](https://www.freecodecamp.org/news/how-to-find-a-windows-10-product-key/)

## Remarks
