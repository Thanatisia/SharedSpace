# Linux commands - test

## Information
### Project
+ Author: GNU
+ Package: coreutils

## Setup

** Dependencies **
------------------

** Pre-Requisites **
--------------------

## Documentations

** Synopsis/Syntax **
---------------------

> Base

```bash
test {options} <arguments> [expression]
```

** Parameters **
----------------
- Positionals
    - expression : An expression in 'test' is effectively the conditions you wish to 'test' and/or compare to see if they are true/false
        - Notes
            + An omitted expression defaults to false, otherwise, the expression is set to true/false based on the comparison result and sets the exit status
        - Expression Formats
            - Boolean Tests
                - TRUE format : '()' operator; The expression is true
                    ```bash
                    test (expression)
                    ```
                - FALSE (Negation/Negative/NOT) format : '!' operator; The opposite/reverse of the expression is true; expression is false
                    ```bash
                    test ! expression
                    ```
                - AND comparison (&&) : '-a' flag; Both expressions are true; Binary '-a' and '-o' are inherently ambiguous. Use '&&' or '||' instead
                    ```bash
                    test EXPRESSION_1 -a EXPRESSION_2
                    ```
                - OR comparison (||) : '-o' flag; Either expressions can be true; at least one is true - not both
                    ```bash
                    test EXPRESSION_1 -o EXPRESSION_2
                    ```
            - String Tests
                - NON-NULL String : '-n' flag; Checks/tests if the length of the specified string is non-zero
                    ```bash
                    test -n STRING
                    ```
                - NULL String : '-z' flag; Checks/tests if the length of the specified string is zero
                    ```bash
                    test -z STRING
                    ```
                - String Equal : '=' operator; The strings are equal; The result is true if the strings are the same
                    ```bash
                    test STRING1 = STRING2
                    ```
                - String Not Equals : '!=' operator; The strings are not equals; The result is true if the strings are not the same
                    ```bash
                    test STRING1 != STRING2
                    ```
            - Integer Tests
                - Integer Equals : '-eq' flag; The result is true if the integers are the same
                    ```bash
                    test INTEGER1 -eq INTEGER2
                    ```
                - Integer Not Equals : '-ne' flag; The result is true if the integers are not the same
                    ```bash
                    test INTEGER1 -eq INTEGER2
                    ```
                - Integer Greater than or Equals to comparison : '-ge' flag; The result is true if INTEGER1 is greater than or equals to INTEGER2
                    ```bash
                    test INTEGER1 -ge INTEGER2
                    ```
                - Integer Greater than comparison : '-gt' flag; The result is true if INTEGER1 is greater than INTEGER2
                    ```bash
                    test INTEGER1 -gt INTEGER2
                    ```
                - Integer Less than or Equals to comparison : '-le' flag; The result is true if INTEGER1 is less than or equals to INTEGER2
                    ```bash
                    test INTEGER1 -le INTEGER2
                    ```
                - Integer Less than comparison : '-lt' flag; The result is true if INTEGER1 is less than INTEGER2
                    ```bash
                    test INTEGER1 -lt INTEGER2
                    ```
            - File Tests
                - Have the same device and inode numbers : '-ef' flag; The result is true if FILE1 and FILE2 have the same device and inode numbers
                    ```bash
                    test FILE1 -ef FILE2
                    ```
                - Newer (Modification Date) than Check : '-nt' flag; The result is true if FILE1 is newer than FILE2 in terms of modification date
                    ```bash
                    test FILE1 -nt FILE2
                    ```
                - Older (Modification Date) than Check : '-ot' flag; The result is true if FILE1 is older than FILE2 in terms of modification date
                    ```bash
                    test FILE1 -ot FILE2
                    ```
                - Check if file exists and is block special : '-b' flag; Checks for block files such as SATA|AHCI = /dev/sdX, NVME = /dev/nvme[disk-number], Loopback = /dev/loop[loop-device-number]
                    ```bash
                    test -b FILE
                    ```
                - Check if file exists and is character special : '-c' flag
                    ```bash
                    test -c FILE
                    ```
                - Check if file exists and is a directory : '-d' flag
                    ```bash
                    test -d FILE
                    ```
                - Check if file exists : '-e' flag
                    ```bash
                    test -e FILE
                    ```
                - Check if file exists and is a file : '-f' flag; Returns false for a directory
                    ```bash
                    test -f FILE
                    ```
                - Check if file exists and is set-group-ID : '-g' flag
                    ```bash
                    test -g FILE
                    ```
                - Check if file exists and is owned by the effective group ID : '-G' flag
                    ```bash
                    test -G FILE
                    ```
                - Check if file exists and is a symbolic link : '-h' flag; Same as '-L' flag
                    ```bash
                    test {-h|-L} FILE
                    ```
                - Check if file exists and has its sticky-bit set (i.e. 0x[MODIFIER]) : '-k' flag
                    ```bash
                    test -k FILE
                    ```
                - Check if file exists and has been modified since it was last read : '-N' flag
                    ```bash
                    test -N FILE
                    ```
                - Check if file exists and is owned by the effective user ID : '-O' flag
                    ```bash
                    test -O FILE
                    ```
                - Check if file exists and is a named pipe : '-p' flag
                    ```bash
                    test -p FILE
                    ```
                - Check if file exists and the user has read access : '-r' flag
                    ```bash
                    test -r FILE
                    ```
                - Check if file exists and has a size greater than zero : '-s' flag
                    ```bash
                    test -s FILE
                    ```
                - Check if file exists and is a socket : '-S' flag
                    ```bash
                    test -S FILE
                    ```
                - Check if file descriptor (FD) of FILE is opened on a terminal : '-t' flag
                    ```bash
                    test -t FD
                    ```
                - Check if file exists and its set-user-ID bit is set : '-u' flag
                    ```bash
                    test -u FILE
                    ```
                - Check if file exists and the user has write access : '-w' flag
                    ```bash
                    test -w FILE
                    ```
                - Check if file exists and the user has execute (or search) access : '-x' flag
                    ```bash
                    test -x FILE
                    ```
- Optionals
    - With Arguments
    - Flags
        + --help : Display help message and exit
        + --version : Display version information to standard output and exit

** Usage **
-----------

### File Tests

> Test/check if file object is a directory

```bash
test -d [file] && \
    # Success Command
    echo -e "Success!" || \
    # Error Command
    @echo -e "Error!"
```

> Test/check if file object is a file

```bash
test -f [file] && \
    # Success Command
    echo -e "Success!" || \
    # Error Command
    @echo -e "Error!"
```

> Test/check if file object is readable

```bash
test -r [file] && \
    # Success Command
    echo -e "Success!" || \
    # Error Command
    @echo -e "Error!"
```

> Test/check if file object is writable

```bash
test -w [file] && \
    # Success Command
    echo -e "Success!" || \
    # Error Command
    @echo -e "Error!"
```

> Test/check if file object is executable

```bash
test -x [file] && \
    # Success Command
    echo -e "Success!" || \
    # Error Command
    @echo -e "Error!"
```

## Wiki

## Resources

## References
+ [OpenSource - 2022-10-26 - Tips for using the Linux test command](https://opensource.com/article/22/10/test-command-linux)

## Remarks

