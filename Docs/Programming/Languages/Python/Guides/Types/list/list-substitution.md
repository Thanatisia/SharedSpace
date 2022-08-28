# python - one-liner - list substitution

## Information
```
In python, you can do a list comprehension one liner whereby

- by running a single liner for loop that will generate the values and return all the values as a list. 

- The results returned from the for loop are then parsed and appended into the resulting list.
    - after the for loop has ended, the entire list is then returned to the variable
```

## Documentation 

### Synopsis/Syntax
```python
res = [ {return-value|formula|attributes|declaration} {for-loop} {if-condition} ]
```

### Usage 
- Regular For Loop 
    ```python
    res = []
    val = 0
    for i in range(min, max, increment): 
        val = 2 ** x
        res.append(val)
    ```

- List Comprehension/One Liner
    + Return Value/To Append into List : 2**x
    + For Loop : for x in range(10)
    ```python
    res = [2**x for x in range(10)]
    ```

## Examples 
1. Find all powers of base 2 up to 1024
    ```python
    res = [2**x for x in range(10)]
    res = [2**0, 2**1....,2**10]
    res = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
    ```

    
