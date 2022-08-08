# CSS - Importing external css files in css

## Documentation

### Synopsis/Syntax 

- Import 
    + @import url("/path/to/file.css");
    + @import "/path/to/file.css";

- Creating variable
    ```css
    :root {
        var_name: value;
    }
    ```

- Using variable in selector
    + selector: var(var_name);

### Usage
- Basics
    - my-ext-style.css
        ```css
        :root {
            --var1: value;
            --var2: value;
        }
        ```

    - main.css
        ```css
        @import url("my-ext-style.css");

        // ID
        .id {

        }

        // Class
        #class {
            color: var(--var1);
            background-color: var(--var2);
        }
    ```
