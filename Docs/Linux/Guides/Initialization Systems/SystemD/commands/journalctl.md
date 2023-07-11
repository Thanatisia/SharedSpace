# systemd package commands documentation: journalctl

## Information
### Description
```
journalctl is a journaling CLI utility that is part of the systemd init system suite of built-in commands/packages/scripts.
```

## Documentation
### Synopsis/Syntax
```console
journalctl {options}
```

### Parameters
- Positionals

- Optionals
    - With Arguments
    - Flags
        + -e 
        + -x

### Usage

## Wiki
### Snippets and Examples
- Filter out event keywords
    ```console
    journalctl -xe | grep [keyword]
    ```
    - Filter out SSH connections
        ```console
        journalctl -xe | grep ssh
        ```


## Resources

## References

## Remarks