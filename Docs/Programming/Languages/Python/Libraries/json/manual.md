# Docs - Python Module : json

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

This module is for handling JSON API data in Python, allowing for
+ Reading JSON files
+ Writing to JSON files

## Setup

### Pre-Requisites

- python
- pip

### Obtaining

+ Built-in

## Documentation

### Importing
- Import module
	```python
	import json
	```
- Import class
	```python
	from json import [class]
	```

### Classes
+ json

### Variables

### Functions

#### Serializing JSON

+ .dump(data, file_object) : Write the JSON data object to the file
+ .dumps(dictionary, sort_keys={True|False}, indent=[indent-space], seperators=('','')...) : Export the Dictionary object into JSON string content
    - Parameters
        - dictionary : The dictionary object you want to convert into JSON string
            + Type : <'dict'>
    - Options
        - sort_keys : To sort the output of dictionaries of the serialized JSON key-value according by key
            + Type : <'bool'>
        - indent : The number of indentation spaces
            + Type : <'int'>
        - separators : The separators used by the key and value tuple
            + Type : <'tuple'>
            + Value Example : (item_separator, key_separator)

#### Deserializing JSON

+ .load()
+ .loads(json_string) : Import/Load the JSON string into a Dictionary object
    - Parameters
        - json_string : The serialized JSON string object you want to import into the program as a Dictionary object
            + Type : <'str'>
    - Options
        - 

### Synopsis/Syntax

#### Serializing JSON (Writing to File)

- Write Serialized dictionary/JSON data to file
	```python
	with open("json-file.json", "w") as fwrite:
		json.dump(data, fwrite)
		fwrite.close()
	```

- Write Serialized dictionary/JSON data to file and continue using
	```python
	json_string = json.dumps(data)
	```

#### Deserializing JSON (Reading from File)

- Convert JSON to dictionary
	```python
	decoded_content = json.loads(json_string) # Dictionary
	```

- Convert Dictionary to JSON
	```python
	data = {}
	encoded_content = json.dumps(data) # String
	```

### Parameters

### Usage

- General Flow
	```python
	json_string = """
	{
		"id" : "",
		"name" : "",
		"list" : [

		],
		"mappings" : {

		}
	}
	"""
	data = json.loads(json_string) # Type <dict>

	json_string = json.dumps(data) # Type <str>
	```

- With 'requests'
	```python
	import json
	import requests

	response = requests.get("https://jsonplaceholder.typicode.com/todos") # Download JSON API GET request
	todos = json.loads(response.text) # Load JSON GET API Response text
	```

## References

## Resources

+ [RealPython - JSON](https://realpython.com/python-json/)

## Remarks

