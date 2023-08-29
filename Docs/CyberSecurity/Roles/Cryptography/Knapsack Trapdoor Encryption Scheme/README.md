# Implementation of Trapdoor Knapsack Encryption Scheme

### System
+ OS: Windows 10
+ Language: Python 3.10.0

### Application
- Intended Output: 
    - Displays 
        + Base Value to be tested
        + Number of rounds/tries
        + The Random Values Used
        + Result if the value is prime or not
        - i.e. Base 13, Tries 10
            ```
            Base : 13
            Tries: 10

            Test [9]: 1
            Test [8]: 1
            Test [7]: 1
            Test [6]: 1
            Test [5]: 12
            Test [4]: 1
            Test [3]: 1
            Test [2]: 1
            Test [1]: 12
            Test [0]: 12

            Random Values Used: [4, 3, 3, 4, 2, 12, 3, 10, 6, 8, 11]

            13 may be Prime
            ```

## Setup
### Dependencies
+ python3

## Documentation
### Synopsis/Syntax
python knapsack.py [size-of-knapsack] [superincreasing-knapsack-values (Please separate with a ',' delimiter)] [modulus] [multiplier]

### Usage
- Features 
    - Command Line Arguments support
        + You can input the required parameters using both CLI arguments and the Terminal stdin read

- Running the application
    python knapsack.py [size-of-knapsack] [superincreasing-knapsack-values (Please separate with a ',' delimiter)] [modulus] [multiplier]

## Resources

## References

## Remarks
