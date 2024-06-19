# Understanding the Windows Registry

## Registry Key-Value Syntax Structure
- HKEY_CURRENT_USER\
    - AppEvents\
    - Console\
    - Control Panel\
    - Environment\
        - Values
            > Attribute        Type             Value
            + OneDrive         REG_EXPAND_SZ    <OneDrive-path>
            + OneDriveConsumer REG_EXPAND_SZ    <OneDrive-path>
            + Path             REG_EXPAND_SZ    %USERPROFILE%\AppData\Local\Microsoft\WindowsApps;%USERPROFILE%\.dotnet\tools;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps
            + TEMP             REG_EXPAND_SZ    %USERPROFILE%\AppData\Local\Temp
            + TMP              REG_EXPAND_SZ    %USERPROFILE%\AppData\Local\Temp
    - EUDC\
    - Keyboard Layout\
    - Microsoft\
    - Network\
    - Printers\
    - SOFTWARE\
    - System\
    - Uninstall\
    - Volatile Environment\

## Registry Handling from Command Line
- Querying/Obtaining the registry key-values from command line
    - Using 'reg query'
        ```bash
        reg query "Key\Sub-Key-1\Subkey-2\...\Subkey-N" /v "key-value"
        ```

## Documentations
### Usages
- Obtaining the System 'PATH' Environment Variable values
    ```bash
    reg query "HKEY_CURRENT_USER\Environment" /v PATH
    ```

## Wiki

## Resources

## References

## Remarks

