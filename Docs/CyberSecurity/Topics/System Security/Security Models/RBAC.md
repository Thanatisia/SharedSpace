# Role-Based Access Control Model

## Common Uses
+ Linux Kernel

## Theory and Information
- Explain RBAC
    ```
    RBAC : Role-Based Access Control Model

    The RBAC model, used by the Linux Kernel, defines the access rights of individuals 
    based on the roles that users assuume in a system.

    Typically, a role is defined as a job function within an organization
        - I.E.
            + Director

    Access Rights are assigned to roles, and in turn, users are assigned to different roles
        - Either statically or dynamically

    RBAC is flexible
        - It can implement
            + Mandatory Access Control (MAC) or
            + Discretionary Access Control (DAC)
    ```
- Relationship among RBAC models
    + Defined using 4 conceptual models for the ongoing standardization efforts
    ```
    RBAC<1> : Role Hierarchies
        |
        |-- RBAC<0> : Base Model (Basic Roles, Lowest Model)
            |
            |--- RBAC<2> : Constraints
            |
        |-- RBAC<3> : Consolidated Model (Highest Model)
    ```
    - RBAC<0> : Inherits RBAC<1>
    - RBAC<2> : Inherits RBAC<0> and RBAC<3>
    - RBAC<3> : Inherits RBAC<1>

- Components of a RBAC base model (RBAC<0>)
    - User
        + An individual that has access to a computer system
        + Each individual has an associated User ID `$(id -u)`
    - Role
        + aka "Group"
        + A named job function within an organization that controls a computer system
        + Typically, associated with each role/group is a description of the authority and responsibility conferred on this role,
        + and on any user who assumes this role
        + Each role/group has an associated Group ID `$(id -g)`
        - Many-to-Many relationship
            + 1 Role/group can have many permissions
            + 1 Permission can have many roles/groups
    - Permission
        + aka "Modifier", "Access Right", "Privilege", "Authorization
        + An approval of a particular mode of access to one or more objects
        - Permission Modifiers
            + w : Write
            + r : Read
            + x : Execute
    - Session
        + Mapping between user and role/group
        + Many-to-Many relationship
            + 1 User can have many roles/groups
            + 1 Role/Group can have many Users

- Role Hierarchies Model (RBAC<1>)
    + This model provides a means of reflecting the hierarchical structure of roles in an organization
    - Typically
        + Job Functions with greater responsibility have greater authority to access resources
        + A subordinate job function may have a subset of the access rights of the superior job function 
            + Inheritance
    + Makes use of the concept of Inheritance to enable one role to implicitly include Access Rights associated with a subordinate role

- Constraint Model (RBAC<2>)
    + This model provides a means of adapting RBAC to the specifics of Administrative and Security Policies in an organization
    - 3 Types of Constraints Proposed and implemented
        - Mutually-Exclusive Roles
            - The same user can be assigned to at most one role in a mutually-exclusive set
                + Mutually exclusive constraint supports a seperation of duties and capabilities within an organization
            - Summary
                + Cannot be assigned to the same user
                - 1-to-1 Relationship
                    + Each role/group can only be assigned to 1 user at any 1 time
        - Cardinality
            + Refers to setting a maximum number of users per role
            + One such constraint is
                + To set a maximum number of users that can be assigned to a given role
                    - Example
                        + Only one person can fill the role of department chairperson
        - Pre-Requisite
            - A user can only be assigned to a particular role IF
                + it is already assigned to some other specified role

- Consolidated Model (RBAC<3>)
    + Provides both hierarchies and constraints
    + Combines RBAC<1> and RBAC<2>

