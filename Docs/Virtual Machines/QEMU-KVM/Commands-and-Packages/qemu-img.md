# KVM/QEMU Commands/Subpackages : qemu-img

## Documentations
### Synopsis/Syntax
```console
qemu-img [options] <arguments>
```

### Parameters
- Positionals
    - Actions
        - `create [disk-image-name] [size]` : Initialize and Create a new '.qcow' disk image
            - Positionals
                - disk-image-name : Specify the disk image file name
                    + Type: String
                    - Examples
                        + [image-name].img
                - size : Specify the size of the disk image
                    + Format: "xGiB|xGB|xMiB|xMB"
                    + Type: String
        - `convert {options} [input-file-name] [output-file-name]` : Convert the specified input file name to the output file name according to options provided
            - Positionals
                - input-file-name : Specify the input file you wish to convert
                    + Type: String
                - output-file-name : Specify the output file you wish to convert to
                    + Type: String
            - Options
                - With Arguments
                    + -f [format] : Specify the file format of the input file
                    + -O [format] : Specify the file format of the output file
                - Flags
- Optionals
    - With Arguments
    
    - Flags

### Usage
- Convert file to another file format
    ```console
    sudo qemu-img convert -f [input-file-format] -O [output-file-format] [input-file-name] [output-file-name]
    ```
- To Initialize a file
    ```console
    qemu-img create [image-name].img [size]
    ```

## Wiki
### Snippets and Examples
- To convert Oracle VBox (VDI) to QEMU (qcow)
    - Information
        + VBox File Format: vdi
        + QEMU File Format: qcow2
    ```console
    sudo qemu-img convert -f vdi -O qcow2 [input-file-name] [output-file-name]
    ```

## Resources

## References

## Remarks
