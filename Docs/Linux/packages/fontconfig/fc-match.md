# Font utilities : fc-match

## Information
### Application
+ Package: fontconfig
+ Name: fc-match

### Description
- Tries to match the installed font(s) most suitable for the pattern thats passed to it
    - If no pattern is provided, it will return the default font

## Setup
### Dependencies
+ fontconfig

### Pre-Requisites

## Documentations
### Synopsis/Syntax
```bash
fc-match {optionals} <arguments> {font-style} {delimiter} {properties}=<values>
```

### Parameters
- Positionals
    - font-style : Specify the target font style to find
        + Type: String
        - Styles
            + monospace
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
        + `-f | --format <formats>` : Specify the format you want to use on the output of the commands; This does the same thing as the colon notation and font properties
    - Flags
        + -a : Sorted match of all installed fonts (from suitable to unsuitable)
        + -s : Sort in order of suitability

### Usage
- Find the best monospace font
    ```bash
    fc-match monospace
    ```

- Match all fonts with font properties
    - Explanation
        + -s : Get a list of matches sorted in order of suitability
        + monospace : The target font property
        + ':' : Delimiter/Separator in each entry to split/remove
        + family : The target property to look for
    ```bash
    fc-match -s monospace : family
    ```

- Match all fonts with a specific font property
    ```bash
    fc-match <style> : family=<family>
    ```

- Match all fonts whose weights are 80
    ```bash
    fc-match <style> : weight=80
    ```

- Match all fonts that supports a specific language
    - English
        ```bash
        fc-match <style> :lang=en
        ```

- Match the font families and all the languages they support
    ```bash
    fc-match <style> : family lang
    ```

- Match the font families and their font styles
    ```bash
    fc-match <style> : family style
    ```

## Wiki

## Resources

## References
+ [Baeldung - Linux - find installed fonts on the command line](https://www.baeldung.com/linux/find-installed-fonts-command-line)

## Remarks

