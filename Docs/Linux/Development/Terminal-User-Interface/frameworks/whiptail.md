# Linux TUI Framework: whiptail

## Introduction
### Package Information
+ whiptail is a ncurses-based Terminal User Interface (TUI) programming framework similar to dialog
+ a TUI framework/library like whiptail allows you to make a Terminal-based GUI application with Dialogs and Menus in shellscripting

### Basics
- File Descriptors/Status Codes
    + 0 : Standard Input (stdin)
    + 1 : Standard Output (stdout)
    + 2 : Standard Error (stderr)
- Redirectors
    + `>` : Redirect a file descriptor to a file
    + `>&` : Redirect the file descriptor to another file descriptor

## Setup
### Pre-Requisites
### Dependencies
+ whiptail

### Importing

## Documentation
### Synopsis/Syntax
```console
whiptail {options} <arguments>
```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + --checklist : Create a checklist
            - Synopsis/Syntax
                ```console
                whiptail --checklist "Message" [width] [height] [number-of-choices] [all-choices ("title/key" "body/value" [STATE])]
                ```
            - Notes
                + Similar to a Radiolist; but you can select more than one item
                + The selected item will be displayed on the command line
                - User will press the space bar to select the choice
                    + Then hit the enter key to choose an item
                + Please place each choice in a new line
                - If no default item gets set
                    + The selected item gets returned to stderr
                    - Therefore, you need to reverse the direction of the input to display on the stdout instead
                        + append `3>&1 1>&2 2>&3`
            - Parameters
                - Positionals
                    + message : The title/message of the Input TextBox
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
                    + number-of-choices : Specify the number of rows/choices
                    + all-choices : List of all choices; Syntax: `"Title/Key" "Body/Value" [STATE]`; Please place all choices in a newline (append with a '\' delimiter)
                        - States
                            + OFF : Deselect the RadioButton by default
                            + ON : Select the RadioButton by default
        + --gauge : Create a Progress Bar; Pipe a command output into the command
            - Synopsis/Syntax
                ```console
                command | whiptail --gauge "Message" [height] [width] [percentage]
                ```
            - Parameters
                - Positionals
                    + message : The name/message of the progress bar
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
                    + percentage : Specify the counter starting index; typically from 0 => 100
        + --inputbox : Get user input and store/return the result in a variable
            - Synopsis/Syntax
                ```console
                whiptail --inputbox "Message" [width] [height] {3>&1 1>&2 2>&3}
                ```
            - Notes
                - whiptail sends input to the stderr by default
                    - Therefore, you need to reverse the direction of the input to display on the stdout instead
                        + append `3>&1 1>&2 2>&3`
            - Parameters
                - Positionals
                    + message : The title/message of the Input TextBox
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
        + --menu : Create a menu box for the user to select a set of choices
            - Synopsis/Syntax
                ```console
                whiptail --menu "Message" [width] [height] [number-of-choices] [all-choices ("title/key" "body/value")]
                ```
            - Notes
                + User press the enter key to select a menu item
                + Please place each choice in a new line
                - If no default item gets set
                    + The selected item gets returned to stderr
                    - Therefore, you need to reverse the direction of the input to display on the stdout instead
                        + append `3>&1 1>&2 2>&3`
            - Parameters
                - Positionals
                    + message : The title/message of the Input TextBox
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
                    + number-of-choices : Specify the number of rows/choices
                    + all-choices : List of all choices; Syntax: `"Title/Key" "Body/Value"`
        + --msgbox : Create a Message Box to display a message to the reader; Only has an OK button
            - Synopsis/Syntax
                ```console
                whiptail --msgbox "Message" [width] [height]
                ```
            - Parameters
                - Positionals
                    + message : The message to display in the box
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
        + --passwordbox : Get Password input from User and hide the plaintext
            - Synopsis/Syntax
                ```console
                whiptail --passwordbox "Message" [width] [height]
                ```
            - Parameters
                - Positionals
                    + message : The title/message of the Password Box
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
        + --radiolist : Create a Radiolist Box, a list of Radio Buttons
            - Synopsis/Syntax
                ```console
                whiptail --radiolist "Message" [width] [height] [number-of-choices] [all-choices ("title/key" "body/value" [STATE])]
                ```
            - Notes
                + When the user only needs to select one option
                + Radiolist creates a list of RadioButtons - a button where the user can only select one
                + The selected item will be displayed on the command line
                - User will press the space bar to select the choice
                    + Then hit the enter key to choose an item
                + Please place each choice in a new line
                - If no default item gets set
                    + The selected item gets returned to stderr
                    - Therefore, you need to reverse the direction of the input to display on the stdout instead
                        + append `3>&1 1>&2 2>&3`
            - Parameters
                - Positionals
                    + message : The title/message of the Input TextBox
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
                    + number-of-choices : Specify the number of rows/choices
                    + all-choices : List of all choices; Syntax: `"Title/Key" "Body/Value" [STATE]`; Please place all choices in a newline (append with a '\' delimiter)
                        - States
                            + OFF : Deselect the RadioButton by default
                            + ON : Select the RadioButton by default
        + --textbox : Display the contents of a file using a Text Box
            - Synopsis/Syntax
                ```console
                whiptail --textbox {--scrolltext} [textfile-name] [width] [height]
                ```
            - Parameters
                - Positionals
                    + textfile-name : The name of the text file to open and display
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
        + --title : Specify the title of your dialog box
            - Synopsis/Syntax
                ```console
                whiptail --title "your-title"
                ```
            - Notes
                + Use this with other parameters/boxes to provide those with a title
        + --yesno : Get a user response with either a "Yes" or "No"
            - Synopsis/Syntax
                ```console
                whiptail --yesno "Message" [width] [height]
                ```
            - Parameters
                - Positionals
                    + message : The message to display in the box
                    + width : Specify the width of the Message Box
                    + height : Specify the height of the Message Box
    - Flags
        + --separate-output : Split the output and outputs the result one line at a time, with no quoting; For use with checklist/radiolist widgets
        + --scrolltext : Add a scrollbar to the box

### Usage
- To return the result of a box to a variable
    - CheckList Box
        ```console
        SELECTED=$(whiptail --checklist "Title" 20 100 10 \
        "Option 1" "Option 1 Body" OFF \
        "Option 2" "Option 2 Body" OFF \
        "Option 3" "Option 3 Body" OFF 3>&1 1>&2 2>&3)

        echo "$SELECTED"
        ```
    - RadioList
        ```console
        SELECTED=$(whiptail --seperate-output --radiolist "Title" 20 100 10 \
        "Option 1" "Option 1 Body" OFF \
        "Option 2" "Option 2 Body" OFF \
        "Option 3" "Option 3 Body" OFF 3>&1 1>&2 2>&3)

        echo "$SELECTED"
        ```

## Wiki

### Frequently-Asked Questions
- How to specify specific colours in whiptail boxes
    - Use 'NEWT' colour library
        + Specify NEWT colours
            ```console
            export NEWT_COLORS='your-colors'
            ```
- How to swap standard stdout and stderr
    - Append `3>&1 1>&2 2>&3` behind your whiptail command
        + This will perform the following redirections
            1. 3>&1 : Create a new file descriptor `3` and redirect it to file descriptor `1 (stdout)`
            2. 1>&2 : Redirect the file descriptor `1` => `2 (stderr)`
            3. 2>&3 : Redirect the file descriptor `2` => `3 (stdout)`
        + After this, if the program prints something to the file descriptor `1 (stdout)`, it will be printed to the file descriptor `2 (stderr)` and then to `3 (stdout)`

## Resources
+ [WikiBooks - Bash Shell Scripting - Whiptail](https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail)
+ [Debian Manpages - Whiptail](https://manpages.debian.org/testing/whiptail/whiptail.1.en.html)

## References
+ [linuxhint - Whiptail Interactive Shell Scripts (TUI)](https://linuxhint.com/whiptail-interactive-shell-scripts/)
+ [YouTube - DistroTube - Add Dialogs and Menus to Shell Scripts with Whiptail](https://youtube.com/watch?v=KsiPYMKSHU8)
+ [Unix StackExchange - Questions - 42728 - What does "3>&1 1>&2 2>&3" do in a script?](https://unix.stackexchange.com/questions/42728/what-does-31-12-23-do-in-a-script)

## Remarks


