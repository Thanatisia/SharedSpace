# SQL Injection Examples

- Basic '1 = 1 #
    - Entering in the password field, once can login to the system successfully
        + *'admin'* in the username field and *123 '* or
        + 1 = 1 #
    - NOTES
        + SQL Statement  [SELECT * FROM accounts WHERE username = 'admin' AND password = '123' or 1=1#]