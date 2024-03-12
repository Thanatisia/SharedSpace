# Regex Syntax Comparison and Difference chart

## Comparison

### Operator

------------------------
| Vim |  Sed | Meaning |
|:---:|:----:|:-------:|
| '$' | Same | All occurences of the substring at the end |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|

### Snippets

-----------------------
| Vim | Sed | Meaning |
|:---:|:---:|:-------:|
| '[^<your-substring>]*'                    | Same | All occurences of that substring within the selected rows (or all rows if using '%'); Allow for an empty column |
| 's/<target-string>/<substitute-substring>'| Same | Substitute the target string with the specified substring |
| 's/.\{N}$//'                              | Same | Match any character (.) exactly N times followed by the end of the line and replace it with the replacement string |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|


