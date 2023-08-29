# Fast Exponentiation - Square and Multiply

### System
+ OS: Windows 10
+ Language: Python 3.10.0

### Application
- Intended Output: 
    - Display all steps required, such as
        1. Converting b into binary
        2. Converting binary b into S (Square) and X (Multiply) notations
        3. Removing the first 'SX'
        4. Beginning computation of each S and SX elements
        ```
        Base : 7
        Exponent : 219
        Modulus : 1823

        Pre-Requisites:
        a : 7
        b : 219
        p : 1823

        1. Converting b into binary...
        Binary: 11011011

        2. Converting binary b into S and X notations...
        Old Binary list b: ['1', '1', '0', '1', '1', '0', '1', '1']
        Replacing 1 with SX
        Replacing 1 with SX
        Replacing 0 with S
        Replacing 1 with SX
        Replacing 1 with SX
        Replacing 0 with S
        Replacing 1 with SX
        Replacing 1 with SX
        New Binary list b: ['SX', 'SX', 'S', 'SX', 'SX', 'S', 'SX', 'SX']

        3. Removing the first 'SX'
        New Binary list b: ['SX', 'S', 'SX', 'SX', 'S', 'SX', 'SX']

        4. Begin computing each S and SX...
        [SX] : (7)^2 x 7 mod 1823 = 343
        [S] : (343)^2 mod 1823 = 977
        [SX] : (977)^2 x 7 mod 1823 = 408
        [SX] : (408)^2 x 7 mod 1823 = 351
        [S] : (351)^2 mod 1823 = 1060
        [SX] : (1060)^2 x 7 mod 1823 = 778
        [SX] : (778)^2 x 7 mod 1823 = 336

        Final Result: 336
        ```

## Setup
### Dependencies
+ python3

## Documentation
### Synopsis/Syntax
python fast-exponentiation.py [base-number (a)] [exponent/power (b)] [modulus/modulo (p)]

### Usage
- Features 
    - Command Line Arguments support
        + You can input the required parameters using both CLI arguments and the Terminal stdin read

- Running the application
    python fast-exponentiation.py [base-number (a)] [exponent/power (b)] [modulus/modulo (p)]

### Snippets
- 22^199 % 71
    python fast-exponentiation.py 22 199 71

- 7^219 % 1823
    python fast-exponentiation.py 7 219 1823

## Resources

## References

## Remarks
