# Salt and Hashing

## Basics

### Hash Function Outcomes
- Deterministic: Assuming you have a message (X)
    + Everytime you compute the hash of X, you should get the same value (Y)
        ```
        H(X) = y
        ```

- Probablistic: Assuming you have a message (X)
    + Everytime you compute the hash of X, you should get a different hash value (Y)
        ```
        H(X) = y1
        H(X) = y2
        ...
        ```
    + Can be achieved with salting

### Password Salting
+ The "Salt" is a value that is randomly generated
+ The hash of the combination of the salt and the password is stored in the database
+ The salt used is also stored somewhere for reference when validating
- Syntax
    ```
    hash_salt_string = message-string + salt-message
    hash_digest = Hash(hash_salt_string)

    // Store hash_digest in database
    ```
    - Examples
        + Message = "Hello", Salt = "World"
            ```
            Salt + Message = HelloWorld
            ```

- Salt and Hashing will make a deterministic hash value to a probabilistic hash value that
	+ Will dynamically change based on the salt used


