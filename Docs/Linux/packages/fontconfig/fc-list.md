# Font utilities : fc-list

## Information
### Application
+ Package: fontconfig
+ Name: fc-list

### Description
- Lists all installed fonts
    - fc-list will search through every single font directories in the system
        + /usr/local/share/fonts : System fonts installed manually by user (by copying the directory into it)
        + /usr/share/fonts : Fonts installed via Package Manager
        + $HOME/.local/share/fonts : Userspace home directory local fonts installed manually by user
    + and print out the font families

## Setup
### Dependencies
+ fontconfig

### Pre-Requisites

## Documentations
### Synopsis/Syntax
```bash
fc-list {delimiter} {properties}=<values>
```

### Parameters
- Positionals
    - delimiter : Specify the separator/delimiter to filter
        + Type: String
        - Values
            + ":" : Colon notation; allows to display only the property specified; Leave no space between the symbol and the property to return a verbose output
    - properties : Specify the font property you want to filter and display
        + Type: String
        - Properties
            - family : Search for font family
                + Type: String/Text
            - lang   : Search for fonts that supports the specified language
                + Type: String/Text
                + Values: ISO-639 language codes (i.e. 'en')
            - style  : Search for font styles
                + Type: String/Text
                - Values
                    + Regular
                    + ExtraBold
                    + Italic
            - weight : Search for font weight
                + Type: Integer/Numbers

- Optionals
    - With Arguments
    - Flags
        + -q : Quiet; Suppress all normal output
        + -v : Display verbose output of the whole font pattern for each match (or elements if any is provided)
        + -V : Display version of the program

### Usage
- List all fonts and its family installed on the system (Defaults)
    ```bash
    fc-list
    ```

- List all fonts with font properties
    - Explanation
        + ':' : Delimiter/Separator in each entry to split/remove
        + family : The target property to look for
    ```bash
    fc-list : family
    ```

- List all fonts with a specific font property
    ```bash
    fc-list : family=<family>
    ```

- List all fonts whose weights are 80
    ```bash
    fc-list : weight=80
    ```

- List all fonts that supports a specific language
    - English
        ```bash
        fc-list :lang=en
        ```

- List the font families and all the languages they support
    ```bash
    fc-list : family lang
    ```

- List the font families and their font styles
    ```bash
    fc-list : family style
    ```

## Wiki

## Resources

## References

## Remarks

