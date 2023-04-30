# NSC_BUILDER Use Case Snippet and Examples

```
Some use cases of what you can do with NSC_BUILDER and how to execute them
```

## Snippets and Examples
- Merging game file (.XCI|.NSP) with Update and DLC (.NSP) files into a single .XCI file
    + Startup NSCB.bat
    1. In the Main Menu
        - Type '2' : To enter into MULTI-PACK mode
            + This mode is used to process multiple files for merging/updating
    2. In MULTI-(RE)PACK mode
        - To Add your target Game File, Updates and DLCs
            - Firstly: Drag-and-Drop your game file (.xci|.nsp)
            - Subsequently:
                + Drag and drop your update and DLC files that you wish to merge into the game files
            - Finally
                - When you are done specifying the files
                    + Press enter without any texts
        - To select what to do after processing the selected files
            - Type '2' : To merge and repack the files specified into an XCI file
        - If you want to patch the required system version
            - Notes
                + This is to set it to match the NCACrypto so that it will only ask to update your system in the case that it is necessary
            + (Recommended) Do not patch the Required System Version : Type '0'
            + To patch the system to the required system version : Type '1'
        - After completion
            + Files will be merged and generated into the 'NSCB_output' folder found in the program directory

