# Data Structures and Algorithms - Algorithms - Mathematics - Matrix - Initialize a results matrix vector board

## Information

### Summary
- Data Structure and Algorithm documentation to programatically generate an empty matrix results board with the `[rows x columns]` zero-ed out from 2 matrices of type `array<array<T>>`
    - where
        - The number of columns of Matrix A and The number of rows of Matrix B are the same
            + Number of Columns = number of array/lists in the Matrix
            + Number of Rows = number of elements within each array/list

## Steps/Algorithm
1. Obtain the number of rows in Matrix A (Number of array/lists)
2. Obtain the number of columns in Matrix B (Number of elemnts within each array/list)
3. Initialize an empty list variable for the Matrix results board
4. Iterate through each row in Matrix A and
    + Append an empty array/list to each row (Basically adding a new row to the results matrix vector)
    1. Iterate through each column in Matrix B
        + Append the number 0 to the current position in the matrix results vector (to 'zero' out the matrix results board according to `[matrix_A row count x matrix_B column count]`)

## Snippets

### Python

```python
"""
Data Structures and Algorithm: Matrix Multiplication
"""
import os
import sys

def init_results_matrix_board(matrix_1, matrix_2):
    """
    Initialize a unpopulated, zero-ed out matrix board based on the number of rows of matrix 1 and number of columns of matrix 2
    """
    # Get number of rows in each matrix
    matrix_1_row_count = len(matrix_1)

    # Get number of columns (cells) in each matrix list/row
    matrix_2_number_of_columns = len(matrix_2[0])

    # Initialize a new "results" matrix based on [ number of rows of matrix 1 * number of columns of matrix 2 ] 
    new_matrix = [] # Results list

    # Iterate the number of rows in matrix 1 number of times
    for i in range(matrix_1_row_count):
        # Append a new empty row to the new matrix
        new_matrix.append([])
        # Iterate the number of columns in matrix 2 number of times and append 0 to 'zero' out the matrix results board according to [matrix_1 row x matrix_2 column]
        for j in range(matrix_2_number_of_columns):
            # Append 0 to all columns for the current row
            new_matrix[i].append(0)

    # Return/Output
    return new_matrix
```

## Wiki

## Resources

## References

## Remarks

