# Rainbow Table Implementation and Usages

## Rainbow Table Implementation
- Steps
        1. Hash the password provided with MD5 and get the hex digest (hashed value)
        2. Convert hash digest from base 16 into base 10 (numbers)
        3. Take the hash-decimal value and mod with n (the total number of passwords in the password file) to get the remainder
            - This is the reduction value (aka positional value) of that line
                + The reduction value will be the index to retrieve the next password
        4. Mark the completed password as "True" (for completed)
            - Skip if encountered
        5. Go to the index equals to the Reduction function value
        6. Repeat 1

- The idea is smth like that. You take password 1, for example : fish and md5 hash it, after that you get the gash value and use it to get the reduction index. That index will lead you to password 2, and so on... continue the process until hash 4 then it stores only the password : fish and the hash of password 4


## Rainbow Table Pre-Image Finding
Get input hash from user
Search all tail ends for this hash
If match a row
jump to head of that row, hash the head
check for match
no match, reduce the head to get next segment in chain, check again until the end (4 reductions, so chain length 5)
no match, next row in table
no matches at all, reduce the input hash itself
search the table again

after chain length 5, that means your input hash chain will have been exhausted, so stop altogether and say 'Password not in rainbow table'

```python
for i in range(5):
  for row in rainbow:
    for j in range(5):
```

