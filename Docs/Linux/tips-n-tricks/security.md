# Linux - System Security and Security Hardening

## Information
### Summary
```
Collection of Linux System Security and Security Hardening Snippets, Tips and Tricks
```

## Firewall
- Validate failed brute force entry attempts
    - Information
        + This is to check for who tried to SSH into your system and how many times they tried
        + This is used in Cybersecurity and System Security to check for (D)DoS and SSH Brute Force attempts
    ```console 
    egrep "Failed|failure" /var/log/auth.log
    ```

## Resources

## References

## Remarks
