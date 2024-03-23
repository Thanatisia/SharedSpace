Termux - Quickstart - Things to do after installation
=====================================================

```
Collection of things to do Out-of-the-Box after installation
```

*Task List*
-----------
- Select/Change Repository List
    - Explanation
        + Select your mirrors
    ```bash
    termux-change-repo
    ```

- Update Package Repository list
    - Explanation
        - Parameters
            + `pkg update` : Update the package manager repository list
    ```bash
    pkg update
    ```

- Upgrade local packages
    - Explanation
        - Parameters
            + `pkg upgrade` : Upgrade local packages
    ```bash
    pkg update
    ```

- Install essential packages
    - Packages
        + termux-setup-storage : Gives Termux permissions to access your files in the Internal Storage
    ```bash
    pkg install termux-setup-storage
    ```

- Setup mapping of your Host System's Internal Storage filesystem into Termux's filesystem
    - Notes
        + The mounted host system's filesystem is mounted as read-only for security purposes
    ```bash
    termux-setup-storage
    ```



## Wiki

## Resources

## References

## Remarks

