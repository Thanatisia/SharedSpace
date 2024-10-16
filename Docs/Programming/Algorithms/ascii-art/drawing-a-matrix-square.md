# Data Structure and Algorithms - Print a matrix square

## Information

### Summary
+ Data Structure and Algorithm documentation to programatically draw an ASCII matrix square from a given matrix of type `array<array<T>>`

## Setup

### Pre-Requisites
- Prepare a Matrix to print
    - Format
        ```
        matrix = [
            # List/Arrays == Rows
            # Elements in List/Arrays == Columns
            [ "column_1", "column_2", ..., "column_n" ] 
        ]
        ```
- Obtain the number of rows in Matrix 1 (Number of rows (aka array/list elements) in the matrix)
    - Python
        ```python
        matrix_row_count:int = len(matrix)
        ```
- Obtain the number of columns in Matrix 2 (Number of columns (aka elements in the row array/list elements) in the matrix)
    - Python
        ```python
        matrix_col_count:int = len(matrix[0])
        ```

## Algorithm and Steps
1. Draw/Print out the header/columns (horizontal length - Column Headers)
    - Python
        ```python
        print("# C", end=" ")
        for i in range(matrix_col_count):
            print("{}".format(i), end=" ")
        ```
2. Add a newline to separate the column and begin the rows
    - Python
        ```python
        print("")
        ```
3. Iterate through each rows in the matrix (aliased as 'i')
    - Python
        ```python
        for i in range(matrix_row_count):
        ```
        - Print out the rows (vertical length - Row Number)
            ```python
            print("# {}|".format(i), end="")
            ```
        - Iterate through each cell/column in the matrix and print out
            ```python
            for k in range(matrix_col_count):
                # Get current column
                curr_col = matrix[i][k]

                print(curr_col, end=" ")
        - Print a newline to jump to the next row and line
            ```python
            print("")
            ```

## Snippets

### Python

> Implementation

```python
def print_matrix_square(matrix, verbose=False):
    """
    Print a specified matrix into a matrix vector square

    :: Params
    - matrix : Pass a matrix list (List of Lists where each list represents a row of the matrix and each row contains a column of the matrix)
        + Type: List<List<int>>
        - Format
            [
                [0,1,2,...],
                ...
            ]
    - verbose : Enable/Disable verbose output
        + Type: Boolean

    :: Return
    - matrix_square_str : Return a formatted string of the matrix square for manual printing
        + Type: String
    """
    # Initialize Variables
    matrix_row_count = len(matrix)
    matrix_col_count = len(matrix[0])
    matrix_square_str = ""

    # Print out the columns (horizontal length - Column Headers)
    if verbose: print("# C", end=" ")
    matrix_square_str += "# C "
    for i in range(matrix_col_count):
        if verbose: print("{}".format(i), end=" ")
        matrix_square_str += "{} ".format(i)

    if verbose: print("")
    matrix_square_str += "\n"

    # Iterate through each rows in the matrix
    for i in range(matrix_row_count):
        # Print out the rows (vertical length - Row Number)
        if verbose: print("# {}|".format(i), end="")
        matrix_square_str += "# {}|".format(i)

        # Iterate through each cell/column in the matrix and print out
        for k in range(matrix_col_count):
            # Get current column
            curr_col = matrix[i][k]

            if verbose: print(curr_col, end=" ")
            matrix_square_str += "{} ".format(curr_col)

        if verbose: print("")
        matrix_square_str += "\n"

    # Return/Output
    return matrix_square_str
    ```

> Caller/Usage

```python
def main():
    print("Hello World")

    """
    Initialize Matrix Vectors

    :: Notes
    - Each list represents a row (X value)
    - Each column in the list represents a column (Y value)

    :: Examples
    - Given
        - A matrix vector (Matrix A) with 4 lists, and each list has 2 elements = 4 Rows x 2 Columns => (4x2)
        - A matrix vector (Matrix B) with 2 lists, and each list has 4 elements = 2 Rows x 4 Columns => (2x4)
        - Matrix A x Matrix B = (4x2) x (2x4) = (4x4) = 4 Rows x 4 Columns = 4 Lists x 4 Elements in each list
    """
    matrix_1 = [
        [2,3],
        [3,4],
        [4,5],
        [5,6]
    ]

    matrix_2 = [
        [2,4,5,7],
        [3,4,6,8]
    ]

    print("{} x {}".format(matrix_1, matrix_2))

    new_matrix = matrix_mul_method_1(matrix_1, matrix_2)

    print("")
    print("Matrix 1: ")
    print_matrix_square(matrix_1)
    print("")
    print("Matrix 2: ")
    print_matrix_square(matrix_2)
    print("")

    print("New Matrix: {}".format(new_matrix))
    for i in range(len(new_matrix)):
        # Get current matrix row
        curr_matrix_row = new_matrix[i]

        print("{} : {}".format(i, curr_matrix_row))

        for j in range(len(curr_matrix_row)):
            # Get current row/list's columns
            curr_row_cols = curr_matrix_row[j]

            print("{} : {}".format(j, curr_row_cols))

        print("")

    # Print a matrix square
    matrix_square_str = print_matrix_square(new_matrix)
    print(matrix_square_str)

if __name__ == "__main__":
    main()
```

## Wiki

## Resources

## References

## Remarks

