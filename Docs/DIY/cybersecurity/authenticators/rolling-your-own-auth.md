# Implementing and rolling out your own Authenticator - Password Salt+Hash

## Components
+ Cryptographic Hashing scheme/algorithm : For hashing the password string input with a cryptographic hash function
    - Examples
        + BCRYPT
        + SHA1, SHA256
+ Database

## Steps
### Setup
1. Setup your database table
    - Example Database Schema
        - Database Name: "MyProject"
            - Table : "users"
                ```
                ============================================
                | row_id | username | password_hash | salt |
                ============================================
                ```
### When creating a new user
1. Obtain password keyphrase
    + get user to input a password string/keyphrase
    + randomly generate a random keyphrase string of size N (preferably >= 32-bits)
2. Randomly generate a salt text of size N
3. Hash-and-Salt the key and obtain the hash hex digest
    + Concatenate the password string with the salt
    + Hash the joined keyphrase
    ```
    hash(<password_string> + salt)
    ```
4. Store the Hash hexdigest and Salt into the database table in a new row with
    + Column "username" : Place the new user's user ID here
    + Column "password_hash" : Place the hash generated after hashing the keyphrase using a cryptographical hash function
    + Column "salt" : Place the salt used alongside the cryptographic hash function to hash the keyphrase
### When authenticating a user
- Notes
    + "Authenticating" means "verifying that the user is valid"
1. Obtain the password keyphrase from your user
    + From a file
    + Censored password text input
2. Retrieve the salt of the user from the row containing the user's username
3. Hash-and-Salt the key passphrase using the same cryptographic hash function used for your registration and obtain the hash hex digest
    + Concatenate the password string with the salt
    + Hash the joined keyphrase
    ```
    hash(<password_string> + salt)
    ```
4. Retrieve the hash hex digest of the user from the row containing the user's username
5. Compare the retrieved hash hex digest with the current password hash
    + If the hash matches: User is valid
    + If the hash does not match: User is invalid

## Snippets

## Notes
- This is a password hashing-based authenticator model
    - There are other models that people use, such as
        + OTP : One-Time Password Authentication
        + 2FA : 2-Factor Authentication
        + MFA : Multi-factor Authentication
    - However, generally the core concept and idea is the same
        + The goal of authentication is to verify that the user requesting to login is authenticated to be the right person and is authorized to enter
- Password Managers do a similar idea here but instead of hashing the password string, it encrypts it such that 
    + only when the user has authenticated to the password manager that he/she is valid, will the password manager decrypt the encrypted ciphertext back into the password string for the user to view

