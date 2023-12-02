# Powershell Documentations - Built-in

## Functions
### General

### Formatting
- `Format-Table {options} <arguments>` : Pipe the standard output of a function into the standard input of this function to format the table
    - Options
        - '-Property [property, ...]' : Specify the properties to apply to the table formatting
            - Properties
                - i.e.
                    + lsObjectAccessAuditEnabled
                    + lsAuditEnabled

### Item Properties
- `Get-ItemProperty {options} <arguments>` : Get the properties of the specified path
    - Options
        - '-Path [path-to-retrieve]' : Explicitly specify path to retrieve the property of
            - Special Paths
                + "HKLM:\Key\SubKeys\Values" : To search the paths in the registry
- `Set-ItemProperty {options} <arguments>` : Set a value to the property of the specified registry path
    - Options
        - '-Name [object-name]' : Specify the name of the registry object you wish to modify
        - '-Path [path-to-retrieve]' : Explicitly specify path to retrieve the property of
            - Special Paths
                + "HKLM:\Key\SubKeys\Values" : To search the paths in the registry
        - '-Value [value-to-set]' : Specify the value to set to the registry object

### System Security 
#### Access Control List Rules
- `Get-Acl {options} <arguments>` : Get and Return Access Control List object
    - Options
        + '-Path [path]' : Specify the registry path
    - Attributes
    - Functions
        + AddAuditRule(audit-rule) : Add Audit Rule and Path to the ACL object
- `Set-Acl {options} <arguments>` : Set a value to an ACL object
    - Options
        + '-Path [path]' : Specify the registry path to apply to the ACL object
        + '-AclObject [acl-object]' : Specify the ACL object to set into the system
- `New-Object [object-rule]` : Create a new object value and return to the created object
    - Object Rules
        - System.Security.AccessControl.FileSystemAuditRule("Target", "Actions", "Values,...") : This is for creating a new system security Access Control List (ACL) auditing rule applied to the filesystem
            - Target : This specifies the target user to apply the rule to
                + Everyone : Apply to everyone created
            - Actions : This specifies Actions to execute if rule is triggered
                + ExecuteFile : When a file is executed
                + ReadAttributes : When attribute of a file is read
            - Values : This specifies all values to look out for if successful or failure
                + Success
                + Failure

#### Audit Logs
- `Get-AuditLogConfiguration` : Get the Audit Logging settings and configuration

### Windows
#### Windows Event
- `Register-WinEvent {options} <arguments>` : Register a windows event
    - Options
        + '-LogName [log-name]' : Specify the event log filter name to register
        - '-ProviderName [provider]' : Specify the event log provider name to register to the event log
            - Providers
                + 'Microsoft-Windows-Security-Auditing' : Security Auditing Event
        - '-FilterXPath [event-filter-xml-filepath]' : Specify the Event log filter XML file path
        - '-Verbose' : Enable verbose output

## Wiki

## Resources

## References

## Remarks
