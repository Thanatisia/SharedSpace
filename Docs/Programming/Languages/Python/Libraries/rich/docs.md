# Python library: rich

## Information

### Description
+ Rich is a Python library for rich text and beautiful formatting in the terminal.
- The Rich API makes it easy to add color and style to terminal output. 
    + Rich can also render pretty tables, progress bars, markdown, syntax highlighted source code, tracebacks, and more — out of the box.

### Project
+ Project Package Name: rich
+ Project Author: Textualize
+ Project Type : Command Line Interface (CLI) Application; Design; ncurses
- Repositories
    + GitHub: https://github.com/Textualize/rich
- Documentations
    + https://rich.readthedocs.io/en/latest/

## Setup
### Dependencies
+ python
+ python-pip
+ python-venv
- Python Packages

### Pre-Requisites
- Create Python Virtual Environment
    - Generate Virtual Environment
        ```bash
        python3 -m venv [virtual-environment-name]
        ```
    - Chroot into Virtual Environment
        - Linux-based
            ```bash
            . [virtual-environment-name]/bin/activate
            ```
        - Windows-based
            ```bash
            .\[virtual-environment-name]\Scripts\activate
            ```

- Optionals
    - Append the Virtual Environment directories into system path
        - 'bin' (binaries) directory
            ```bash
            export PATH+="/path/to/[virtual-environment-name]/bin:"
            ```

### Installation
- Install using GitHub
    ```bash
    python3 -m pip git+https://github.com/Textualize/rich
    ```

- Install using PyPI
    ```bash
    python3 -m pip install rich
    ```

## Documentations

### Package
- rich : API to implement rich text and beautiful formatting in the terminal/Command Line interface.

### Module/Libraries
- rich
    - pretty : contains the pretty printing/formatting functions in the rich package
    - console : contains the rich terminal content functions
    - panel : Panel-related Widget Functionalities
    - color : Color-related Functionalities

### Classes
- rich.console
    - `.Console()` : Initializes the Console class object which contains functions that specifically operates with the terminal/command line
        - Returns
            - console : The Console class object
                + Type: rich.console.Console()

- rich.panel
    - `.Panel()` : Initializes the Panel class object which contains Panel-related widget functionalities
        - Returns
            - panel : The Panel class object
                + Type: rich.panel.Panel()

- rich.color
    - `.Color()` : Initializes the Color class object which contains Color-related functionalities
        - Returns
            - color : The Color class object
                + Type: rich.color.Color()

### Functions
- rich
    - `.print(...)` : Overrides the built-in Python function equivalent; Contains the same argument/parameter signature as the built-in python function but supports built-in style setting
        - Notes
            + Rich renders a special markup which is similar in syntax to bbcode
        - Formatting Special Styles in-line
            - `[keywords|color-hex|color-name]` : Format the colour of the text/string to the specified color name/hexadecimal code
                - Usage
                    - Keyword Filters
                        + Display bold  text: `"[bold] your string here"`
                        + Format italics    : `"[u] your string here"`
                        + Format underline  : `"[i] your string here"`
                    - Text Colours
                        + Display red   text: `"[red] your string here"`
                        + Display green text: `"[green] your string here"`
                        + Display blue  text: `"[blue] your string here"`
                        + Display cyan  text: `"[cyan] your string here"`
    - `.inspect(object, methods=[True|False], ...)` : This function inspects and produces a report on any Python objects - such as class, instance or builtin
        - Parameter/Argument Header Signature
            - object : Specify the object you wish to inspect; this can be any python object - class, instance, built-in, lists or dictionaries
                + Type: Objects
            - methods : Enable/Disable check if it contains any methods (aka functions)
                + Type: Boolean

- rich.console.Console()
    - `.log(texts, log_locals=[True|False])` : Similar to 'console.print()', but also renders a column for the current time and the file and line which made the call
        - Notes
            + The log method could be used for logging to the terminal for long running applications such as servers, but is also a very nice debugging aid.
            - By default Rich will do syntax highlighting for Python structures and for repr strings. 
                + If you log a collection (i.e. a dict or a list) Rich will pretty print it so that it fits in the available space. 
        - Parameter/Argument Header Signature
            - texts : Specify the text/data to write (or 'log') into the terminal with the current time and the file and line that made the call
                + Type: Text Objects (String|List|Dictionary)
            - log_locals : outputs a table containing the local variables where the log method was called.
                + Type: Boolean

    - `.print(..., styles)` : Overrides the built-in Python function equivalent; Contains the same argument/parameter signature as the built-in python function but supports style setting
        - Notes
            + Unlike the built-in 'print()' function, rich will word-wrap your text to fit within the terminal width
            + `console.print()` has the same parameter/header signature as the built-in function, except afew differences
        - New Parameter/Header Argument Signature
            - `style="format"` : Specify the style components to set for the entire output
                - Setting styles
                    - Types
                        - `[keywords|color-hex|color-name]` : Format the colour of the text/string to the specified color name/hexadecimal code
                    - Styling examples
                        - Keyword Filters
                            + Display bold  text: `style="bold"`
                            + Format italics    : `style="i"`
                            + Format underline  : `style="u"`
                        - Text Colours
                            + Display red   text: `style="red"`
                            + Display green text: `style="green"`
                            + Display blue  text: `style="blue"`
                            + Display cyan  text: `style="cyan"`
                        - Combination
                            + Display bold + colour text: `style="bold <color>"`

- rich.panel.Panel()
    + `.fit("panel-text", border_style="style")` : Renders a Panel and Fit into CLI

- rich.color.Color()
    + `.parse("color-value")`                    : Parses in the colour value; Examples : {red|blue|green|yellow...}

### Data Types

### Attributes/Variables

### Usage

- Import module/libraries
    - General rich text formatting functions
        ```python
        from rich import print, inspect
        ```
    - Pretty printing
        ```python
        from rich import pretty
        ```
    - Console terminal/command line-focused rich formatting functions
        ```python
        from rich.console import Console
        ```

*Styling and Customizing*
-------------------------
- Pretty Printing
    - Styling your command output
        - Set a style for the entire output
            ```python
            console.print("Hello World", style="style format")
            ```
        - In-line Styling
            - `[bbcode-markup|keywords|color-hex|color-name]` : Format the colour of the text/string to the specified color name/hexadecimal code
                - Keyword Filters
                    + Display bold  text: `"[bold] your string here"`
                    + Format italics    : `"[u] your string here"`
                    + Format underline  : `"[i] your string here"`
                - Text Colours
                    + Display red   text: `"[red] your string here"`
                    + Display green text: `"[green] your string here"`
                    + Display blue  text: `"[blue] your string here"`
                    + Display cyan  text: `"[cyan] your string here"`
                - Emoji
                    + `:smiley:` 
                    + `:vampire:` 
                    + `:pile_of_poo:` 
                    + `:thumbs_up:` 
                    + `:raccoon:`
                - To style only a specific range of words
                    - Use the following syntax: `[format]your string here[/format]`
                        - i.e.
                            - Bold + add a colour to the word "Hello World"
                                ```python
                                console.print("Test1 Test2 [bold color]Hello World[/bold color])
                                ```
                            - Underline the word "Hello World"
                                ```python
                                console.print("Test1 Test2 [u]Hello World[/u])
                                ```
                            - Set the word "Hello World" as italics
                                ```python
                                console.print("Test1 Test2 [i]Hello World[/i])
                                ```

## Wiki

*String Formatting*
-------------------
- `{}` : Format and Substitute the string with a variable
    - Usage
        + In-line string formatting: `f{variable_name}`
        + Using '.format()': `{}.format(variable_name)`

## Resources

## References
+ [Rich Documentations - Rich API](https://rich.readthedocs.io/en/latest/)
+ [Rich Documentations - Console API](https://rich.readthedocs.io/en/latest/console.html)
+ [Rich Documentations - Inspect](https://rich.readthedocs.io/en/latest/reference/init.html#rich.inspect)
+ [rich-cli : CLI application powered by rich](https://github.com/textualize/rich-cli)

## Remarks

