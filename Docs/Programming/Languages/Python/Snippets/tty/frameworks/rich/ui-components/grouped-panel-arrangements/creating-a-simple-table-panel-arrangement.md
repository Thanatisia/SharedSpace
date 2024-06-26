# Python snippets - TUI - Frameworks - rich - UI Components - Arrangements - Using a Panel and Columns to arrange tables

## Steps
1. Import dependencies and packages
    ```python
    from rich import print, print_json
    from rich.columns import Columns
    from rich.console import Console
    from rich.table import Table
    from rich.panel import Panel
    ```

2. Initialize a console object for handling the standard output console
    ```python
    console = Console()
    ```

3. Define your list of tables to create and display
    ```python
    tables = []
    ```

4. Prepare and setup tables to display
    - Initialize a new table and customize it
        ```python
        new_table = Table()
        ```

    - Initialize a list of table columns
        ```python
        table_columns = ["column1", "column2", "column3"]
        ```

    - Initialize a list of table row data
        - Explanation
            - This list contains each row in the table
                + Each element in the list (aka row data) contains a key-value (dictionary) mapping of the header/column the row is under mapped to the value.
                + Format: `[{"column-name" : "value"}, ...]`
        ```python
        table_rows = [{"column1" : "value1"}, {"column2" : "value2"}, {"column3" : "value3"}]
        ```

    - Iterate through the list of table row data you want to populate the table with
        ```python
        for row_number in range(len(table_rows)):
        ```
    
    - Get current row
        ```python
            curr_row = table_rows[row_number]
        ```

    - Initialize a new list of row values (populated with null values to fill all of the columns) to be passed into the table
        ```python
            row_values = ["" for _ in range(len(table_columns))]
        ```

    - Iterate the current row and obtain the column name and the cell value
        ```python
            for col_name, cell_value in curr_row.items():
                # Get header position of column
                col_idx = table_columns.index(col_name)

                # Modify value in the column position to the cell value
                row_values[col_idx] = cell_value
        ```

    - Add column headers into the tables to extend horizontally (X axis)
        ```python
        new_table.add_column(*table_columns)
        ```

    - Add rows into the tables to extend vertically (Y axis) corresponding to the column headers
        ```python
        new_table.add_row(*row_values)
        ```

5. Append your new table into the tables master list
    ```python
    tables.append(new_table)
    ```

6. Create a column group containing the tables
    ```python
    column_grp_Tables = Columns(tables, **column_opts)
    ```

7. Create a panel and insert the table group arranged horizontally, side by side
    ```python
    panel = Panel.fit(column_grp_Tables, title="Display Tables", border_style="blue", title_align="left", padding=(1,2), **panel_fitting_opts)
    ```

8. Print the panel to the console standard output
    ```python
    console.print(panel)
    ```

## Snippets

```python
from rich import print, print_json
from rich.columns import Columns
from rich.console import Console
from rich.table import Table
from rich.panel import Panel

# Initialize Variables

## Initialize a console object for handling the standard output console
console = Console()

## Define your tables
tables = []

# Initialize a new table and customize it
new_table = Table()

# Initialize a list of table columns
table_columns = ["column1", "column2", "column3"]

# Initialize a new list of row values (populated with null values to fill all of the columns) to be passed into the table
row_values = ["" for _ in range(len(table_columns))]

## Iterate through the rows
for row_number in range(len(table_rows)):
    # Get current row
    curr_row = table_rows[row_number]

    ## Iterate the current row
    for col_name, cell_value in curr_row.items():
        # Get header position of column
        col_idx = table_columns.index(col_name)

        # Modify value in the column position
        row_values[col_idx] = cell_value

## Add column headers into the tables to extend horizontally (X axis)
new_table.add_column(*table_columns)

## Add rows into the tables to extend vertically (Y axis) corresponding to the column headers
new_table.add_row(*row_values)

# Append your new table into the tables master list
tables.append(new_table)

# Create a column group containing the tables
column_grp_Tables = Columns(tables, **column_opts)

# Create a panel and insert the table group arranged horizontally, side by side
panel = Panel.fit(column_grp_Tables, title="Display Tables", border_style="blue", title_align="left", padding=(1,2), **panel_fitting_opts)

# Print the panel to the console standard output
console.print(panel)
```

