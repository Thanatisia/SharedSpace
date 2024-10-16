# Algorithms - Matrix Multiplication

## Information

### Summary
- Data Structure and Algorithm documentation to programatically and algorithmically perform Matrix Multiplication

## Mathematics

### Equation and Methodology

1. Matrix_1 = (2x2), Matrix_2 = (2x4), matrix_new = (2x4)
    ```
    matrix_1 = 
    [
        # A1 A2
       #1 x1 x2
       #2 y1 y2
    ]

    x

    matrix_2 = 
    [
      # B1 B2 B3 B4
     #1 x1 x2 x3 x4
     #2 y1 y2 y3 y4
    ]

    matrix_new = 
    [
       # C1                           C2                          C3                          C4
     # 1 (A1_x1*B1_x1)+(A2_x2*B1_y1) (A1_x1*B2_x2)+(A2_x2*B2_y2) (A1_x1*B3_x3)+(A2_x2*B3_y3) (A1_x1*B4_x4)+(A2_x2*B4_y4)
     # 2 (A1_y1*B1_x1)+(A2_y2*B1_y1) (A1_y1*B2_x2)+(A2_y2*B2_y2) (A1_y1*B3_x3)+(A2_y2*B3_y3) (A1_y1*B4_x4)+(A2_y2*B4_y4)
    ]
    ```

> Examples

1. Matrix_1 = (2x2), Matrix_2 = (2x4), matrix_new = (2x4)
    ```
    matrix_1 = 
    [
        2 2
        2 2
    ]

    x

    matrix_2 = 
    [
        2 2 2 2
        3 3 3 3
    ]

    matrix_new = 
    [
        (2x2)+(2x3)=4+6=10 (2x2)+(2x3)=4+6=10 (2x2)+(2x3)=4+6=10 (2x2)+(2x3)=4+6=10
        (2x2)+(2x3)=4+6=10 (2x2)+(2x3)=4+6=10 (2x2)+(2x3)=4+6=10 (2x2)+(2x3)=4+6=10
    ]
    ```

### Rules

1. When multiplying (x1_number_of_rows*y1_number_of_columns) and (x2_number_of-rows*y2_number_of_columns)
    + the number of columns in the first matrix must be equal to the number of rows in the second matrix. 
2. The resulting matrix, known as the matrix product, has the number of rows of the first and the number of columns of the second matrix.
3. The product of matrices A and B is denoted as AB.

- Example
    - (2x2) x (2x4) => OK : The number of columns in matrix 1 and the number of rows in matrix 2 are the same; Result: (2x4)
    - (2x3) x (2x4) => X  : The number of columns in matrix 1 and the number of rows in matrix 2 are not the same

## Algorithm/Steps
1. Perform pre-calculation
    + Obtain the number of rows in Matrix 1 (Number of rows (aka array/list elements) in the matrix)
    + Obtain the number of columns in Matrix 2 (Number of columns (aka elements in the row array/list elements) in the matrix)
2. Generate a 'results' matrix board containing the same number of rows as Matrix 1 and the same number of columns as matrix_2 (Please refer to [the algorithm - Generating a Matrix Results Board](generating-a-matrix-results-board.md))
3. Iterate `[the number of rows in matrix 1]` number of times (aliased as 'i')
    - Iterate `[the number of columns in matrix 2]` number of times (aliased as 'j')
        - Iterate `[the number of rows in matrix 2]` number of times (aliased as 'k')
            - Map and Sum the i-th row and j-th column of the matrix result board to the product (multiplication) of
                + the i-th row and k-th column of matrix 1 and
                + the k-th row and j-th column of matrix 2

## Snippets

### Python

> Initialize the results matrix vector board

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

    # Iterate the number of rows in matrix 1 number of times and append the single row to each row
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

> Matrix Multiplication (Method 1)

```python
def matrix_mul_method_1(matrix_1, matrix_2, matrix_result_board=None):
    """
    Matrix Multiplication

    :: Formula
    matrix_1 = 
    [
        # A1 A2
       #1 x1 x2
       #2 y1 y2
    ]
    
    x
    
    matrix_2 = 
    [
      # B1 B2 B3 B4
     #1 x1 x2 x3 x4
     #2 y1 y2 y3 y4
    ]
    
    matrix_new = 
    [
       # C1                           C2                          C3                          C4
     # 1 (A1_x1*B1_x1)+(A2_x2*B1_y1) (A1_x1*B2_x2)+(A2_x2*B2_y2) (A1_x1*B3_x3)+(A2_x2*B3_y3) (A1_x1*B4_x4)+(A2_x2*B4_y4)
     # 2 (A1_y1*B1_x1)+(A2_y2*B1_y1) (A1_y1*B2_x2)+(A2_y2*B2_y2) (A1_y1*B3_x3)+(A2_y2*B3_y3) (A1_y1*B4_x4)+(A2_y2*B4_y4)
    ]

    :: Given an example
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

    # Size = (4x2) x (2x4) = (4x4) = 16 cells
    matrix_new = [
      # C1           C2          C3          C4
    # N [(A1xB1+A2xB2), (A1xB[N]+A2xB[N+1]), ...]
    # 1 [2x2+3x3=13, 2x4+3x4=20, 2x5+3x6=28, 2x7+3x8=38],
    # 2 [3x2+4x3=18, 3x4+4x4=28, 3x5+4x6=39, 3x7+4x8=53],
    # 3 [4x2+5x3=23, 4x4+5x4=36, 4x5+5x6=50, 4x7+5x8=68],
    # 4 [5x2+6x3=28, 5x4+6x4=44, 5x5+6x6=61, 5x7+6x8=83],
    ]
    """
    # Get number of rows in each matrix
    matrix_1_row_count = len(matrix_1)
    matrix_2_row_count = len(matrix_2)

    # Get number of columns (cells) in each matrix list/row
    matrix_1_number_of_columns = len(matrix_1[0])
    matrix_2_number_of_columns = len(matrix_2[0])

    # Column x Row => number-of-rows number of times
    new_matrix_number_of_cells = matrix_1_row_count * matrix_2_number_of_columns

    # Data Validation: Null Value Check - Check if the starting results matrix board is zero-ed
    if matrix_result_board == None:
        # Initialize a new "results" matrix based on [ number of rows of matrix 1 * number of columns of matrix 2 ] 
        results = init_results_matrix_board(matrix_1, matrix_2)
    else:
        # Initialize a new "results" matrix based on [ number of rows of matrix 1 * number of columns of matrix 2 ] 
        results = matrix_result_board

    # print("Matrix 1: {}".format(matrix_1))
    # print("Matrix 2: {}".format(matrix_2))
    # print("Result Matrix Vector: {} x {}".format(matrix_1_row_count, matrix_2_number_of_columns))
    # print("Generated Results Board: {}".format(results))

    # iterate through rows of matrix-1
    for i in range(matrix_1_row_count):
       # iterate through columns of matrix-2
       for j in range(matrix_2_number_of_columns):
           # iterate through rows of matrix-2
           for k in range(matrix_2_row_count):
               matrix_1_value = matrix_1[i][k]
               matrix_2_value = matrix_2[k][j]
               results[i][j] += matrix_1_value * matrix_2_value
               # print("Matrix 1 Value for matrix_1[{}][{}]: {}".format(i,k,matrix_1_value))
               # print("Matrix 2 Value for matrix_2[{}][{}]: {}".format(k,j,matrix_2_value))
               # print("Results[{}][{}]: {}".format(i, j, results[i][j]))

    return results
```

> Matrix Multiplication (Method 2)

```python
def matrix_mul_method_2(matrix_1, matrix_2, matrix_result_board=None):
    """
    Matrix Multiplication

    :: Formula
    matrix_1 = 
    [
        # A1 A2
       #1 x1 x2
       #2 y1 y2
    ]
    
    x
    
    matrix_2 = 
    [
      # B1 B2 B3 B4
     #1 x1 x2 x3 x4
     #2 y1 y2 y3 y4
    ]
    
    matrix_new = 
    [
       # C1                           C2                          C3                          C4
     # 1 (A1_x1*B1_x1)+(A2_x2*B1_y1) (A1_x1*B2_x2)+(A2_x2*B2_y2) (A1_x1*B3_x3)+(A2_x2*B3_y3) (A1_x1*B4_x4)+(A2_x2*B4_y4)
     # 2 (A1_y1*B1_x1)+(A2_y2*B1_y1) (A1_y1*B2_x2)+(A2_y2*B2_y2) (A1_y1*B3_x3)+(A2_y2*B3_y3) (A1_y1*B4_x4)+(A2_y2*B4_y4)
    ]

    :: Given an example
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

    # Size = (4x2) x (2x4) = (4x4) = 16 cells
    matrix_new = [
      # C1           C2          C3          C4
    # N [(A1xB1+A2xB2), (A1xB[N]+A2xB[N+1]), ...]
    # 1 [2x2+3x3=13, 2x4+3x4=20, 2x5+3x6=28, 2x7+3x8=38],
    # 2 [3x2+4x3=18, 3x4+4x4=28, 3x5+4x6=39, 3x7+4x8=53],
    # 3 [4x2+5x3=23, 4x4+5x4=36, 4x5+5x6=50, 4x7+5x8=68],
    # 4 [5x2+6x3=28, 5x4+6x4=44, 5x5+6x6=61, 5x7+6x8=83],
    ]
    """
    # Data Validation: Null Value Check - Check if the starting results matrix board is zero-ed
    if matrix_result_board == None:
        # Resulting matrix: [matrix_1 row x matrix_2 column]
        matrix_result = init_results_matrix_board(matrix_1, matrix_2)
    else:
        # Resulting matrix: [matrix_1 row x matrix_2 column]
        matrix_result = matrix_result_board

    # iterate through rows of X
    for i in range(len(matrix_1)):
       # iterate through columns of Y
       for j in range(len(matrix_2[0])):
           # iterate through rows of Y
           for k in range(len(matrix_2)):
               matrix_result[i][j] += matrix_1[i][k] * matrix_2[k][j]

    # Return/Output
    return matrix_result
```

> Implementation/Usage

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

if __name__ == "__main__":
    main()
```

## Resources 

## References

## Remarks
