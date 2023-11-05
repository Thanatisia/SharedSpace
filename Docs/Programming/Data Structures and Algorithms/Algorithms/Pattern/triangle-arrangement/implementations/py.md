# Data Structure and Algorithm Patterns - Triangle Arrangement

## Implementations

### Right-Angle Triangle (Horizontal-Right)
```python
rows = 5
for i in range(0, rows):
    for j in range(0, i+j):
         print("*", end=' ')
    print("\n")
```

### Right-Angle Triangle (Horizontal-Left)
```python
rows = 5
for i in range(1, rows+1):
    print("* " * j)
```

### Right-Angle Triangle (Vertical-Right)
```python
rows = 5
for i in range(rows+1, 0, -1):
    for j in range(0, i-1):
         print("*", end=' ')
    print(" ")
```

### Inverse Equilateral Triangle
```python
rows = 5
k = 2 * rows - 2
for i in range(rows, -1, -1):
    for j in range(k, 0, -1):
        print(end=" ")

    k = k + 1

    for j in range(0, i+1):
        print("*", end=" ")

    print("\n")
```

