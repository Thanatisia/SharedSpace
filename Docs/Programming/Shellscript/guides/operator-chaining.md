# Linux Shellscript - Operator Chaining

## Chains
- Using '&' and '&&' together
    - Using '&' (Background process hook) operator 
        - You can chain other commands after calling '&' by wrapping the following commands with the braces ('{}') operator
            ```bash
            [command] & {
                subsequent && \
                commands && \
                arguments; \
                here;
            }
            ```

