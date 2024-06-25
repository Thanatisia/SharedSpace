# Data Serialization Configuration File Structure and Comparisons

## JSON vs YAML vs TOML

> JSON

========================
```json
{ 
    "key1" : "value1", 
    "key2" : "value2",
    ...
}
```
========================
|
|
V
```python
dict = {
    "key1" : "value1",
    "key2" : "value2",
    ...
}
```

========================
```json
[
    { "key1" : "value1", "key2" : "value2" }, # Row N
    ...
]
```
========================
|
|
V
```python
obj = [
    {
        "key1" : "value1",
        "key2" : "value2",
        "key3" : [
            "listvalue1",
            "listvalue2"
         ],
         "key4" : {
             "subkey1" : "subvalue1",
        },
        "key5" : {
            "subkey1" : "subvalue1",
            "subkey2" : {
                "subsubkey1" : "subsubvalue1"
            }
        }
    }
]
```

> YAML

========================
```yaml
key_str : "value1"
key_int : "0-9"
key_list :
    - listvalue1
    - listvalue2
key_dict:
    subkey_1: subkey_1_value
```
========================
|
|
V
```python
dict = {
    "key_str" : "value1",
    "key_int" : 0-9,
    "key_list" : [
        "listvalue1",
        "listvalue2"
    ],
    "key_dict" : {
        "subkey_1" : "subkey_1_value"
    }
}
```

> TOML

========================
```toml
key_str = "value1"
Key_int = 0-9

key_list = [listvalue1, listvalue2]

[key_dict]
subkey1 = "subvalue1"
    
[key_nested_dict]
subkey1 : "subkey1_value"

[key_nested_dict.subkey2]
sub_subkey1 = "sub_subkey1_value"
```
========================
|
|
V
```python
dict = {
    "key_str" : "value1",
    "key_int" : "0-9",
    "key_list" : [
        "listvalue1",
        "listvalue2"
    ],
    "key_dict" : {
        "subkey1" : "subvalue1"
    },
    "key_nested_dict" : {
        "subkey1" : "subkey1_value",
        "subkey2" : {
            "sub_subkey1" : "sub_subkey1_value"
        }
    }
}
```

## Resources

## References

## Remarks


