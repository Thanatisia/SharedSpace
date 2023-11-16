# X11 Display Server - xauth 

## Information
### Background
```
The X11/Xorg authentication and authorization CLI utility
```

## Setup
### Dependencies
+ Xorg : X11 Displayy Server
### Pre-Requisites

## Documentation
### Synopsis/Syntax
```console
xauth [action] :"[display-monitor]" {options} <arguments>
```
### Parameters
- Positionals
    - Actions
        - `add :"[display-monitor]" [algorithm] [16-digit-random-integer-magic-cookie]` : Add the specifies session display with a 16-digit random integer magic cookie value, that is labelled as a specific algorithm, into the xauth authentication and authorization list
            - Algorithms
                + MIT-MAGIC-COOOKIE-1 : Format the 16-digit random integer value into a MIT-MAGIC-COOOKIE-1 format cookie value
        + `list` : List stored sessions in xauth list
        + `remove :"[display-monitor]"` : Remove the stored session mapped to the display monitor from the xauth authentication and authorization list
- Optionals
    - With Arguments
    - Flags
### Usage
- Randomly generate a 16-digit Xauth magic cookie for the current display server session
    - Explanation
        + xauth: The X authentication CLI utility; used to manage/handle X authentication and authorization validations, as well as checking of the Xauthentication file to ensure the cookie inside is valid
        + MIT-MAGIC-COOOKIE-1 : An algorithm used by Xauth to generate a magic cookie
        + "$(od -An -N16 -tx /dev/urandom | tr -d ' ')" : Randomly generate a 16-digit random integer to be the magic cookie
    ```console
    xauth add :"[tty-display-monitor]" MIT-MAGIC-COOKIE-1 "$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
    ```

- Remove session from xauth list
    + Remove current session's display monitor (that we created) from the Xauthority authentication list
    ```console
    xauth remove :"$tty"
    ```

- List stored sessions in xauth list
    ```console
    xauth list
    ```

## Wiki

### Useful Functions
- Randomly generate a 16-digit integer
    ```console
    cookie="$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
    ```

## Resources

## References

## Remarks

