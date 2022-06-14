# Documentation - Python - Namespaces

Converting Namespaces to other types

## Table of Contents
- [Information](#information)
- [Dictionary](#dictionary)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

Namespaces is non-iterable, however, its format is a key-value format which is like __dict__.

Thus, you can use [namespace.__dict__] to iterate through the namespace

## Dictionary
- Converting Namespaces into Dictionary

```python
# Reference : https://stackoverflow.com/questions/14865961/iterate-through-a-namespace
for namespace_Key in your_namespace.__dict__:
	namespace_Value = your_namespace.__dict__[namespace_Key]

	if namespace_Value is not None:
		# Do something here
```

## Resources

+ Iterating through a Namespace : https://stackoverflow.com/questions/14865961/iterate-through-a-namespace

## References

## Remarks
