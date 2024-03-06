# (Neo)vim regex syntax and snippets

## Substitutions
- Select a string and split by a substring/delimiter to multiline
    - Notes
         - Given that
             + Delimiter: ','
    + Enter Visual Mode (v) and Select and highlight the row you want to split
    - Press ':' to enter Command Line Mode and substitute all occurences of the specified delimiter in the selected string, with a '\r' or '\n' split
        - Explanation
            + ':' : Enter Command Line Mode
            + 's/<target-string>/<substitute-substring>' : Substitute the target string with the specified substring
            + '/g' : Global Expression; Specifying this at the end of the string will tell the pattern expression to be applied 'globally' across everything specified
        - Notes
            + You can perform the substitution on the entire file by adding a '%' before the s (:%s)
            + You can add '\t' or other strings in the substitution to add tabs (if necessary)
        ```
        :s/<your-delimiter>/<your-delimiter>\r/g
        ```

- Remove a common substring on the last column of the selected string
    - Notes
         - Given that
             + Common Substring: ','
    + Enter Visual Mode (v) and Select and highlight the row you want to split
    - Press ':' to enter Command Line Mode and remove all occurences of the specified target substring in the selected string
        - Explanation
            + ':' : Enter Command Line Mode
            + 's/<target-string>/<substitute-substring>' : Substitute the target string with the specified substring
            + '[^<your-substring>]*' : All occurences of that substring within the selected rows (or all rows if using '%'); Allow for an empty column
            + '$' : All occurences of the substring at the end
        - Notes
            + You can perform the substitution on the entire file by adding a '%' before the s (:%s)
        ```
        :s/<your-substring>[^<your-substring>]*$//
        ```

- Delete N characters from the end of each line
    - Notes
         - Given that
             + Number of characters from the end of the row(s): 6
    + Enter Visual Mode (v) and Select and highlight the row you want to remove N characters from
    - Press ':' to enter Command Line Mode and remove all occurences of the specified target substring in the selected string
        - Explanation
            + ':' : Enter Command Line Mode
            - 's/<target-string>/<substitute-substring>' : Substitute the target string with the specified substring
                + 's/.\{N}$//' : Match any character (.) exactly N times followed by the end of the line and replace it with the replacement string
            + '$' : All occurences of the substring at the end
        - Notes
            + You can perform the substitution on the entire file by adding a '%' before the s (:%s)
        ```
        :s/.\{N}$//
        ```

## Resources

## References
+ [StackOverFlow - Questions - 11409518 - How do I remove the last six characters of every line in Vim?](https://stackoverflow.com/questions/11409518/how-do-i-remove-the-last-six-characters-of-every-line-in-vim)
+ [StackOverFlow - Questions - 16850699 - In Vim how do I split a long string into multiple lines by a character?](https://stackoverflow.com/questions/16850699/in-vim-how-do-i-split-a-long-string-into-multiple-lines-by-a-character)

## Remarks

