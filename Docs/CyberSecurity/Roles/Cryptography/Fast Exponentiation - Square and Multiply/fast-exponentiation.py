"""
- Square and Multiply - Fast Exponentiation
    - to implement the fast exponentiation using the square and multiply technique as described in the lecture. 
        - That is, you need to compute: a^b (mod p) 
            - Your program needs to input three parameters, namely a, b and p. 
                - Then, you will need to do the following: 
                    + Convert b into binary. 
                    + Convert that binary to the S and X notation. 
                    + Remove the first SX. 
                    + Compute according to the sequence. 
                + The program must output each process one by one to the screen - not directly outputting the final result only. 
                + The number of steps must match the sequence of SX as identified above. 
                - Your implementation must be able to produce result (output) 
                    - where 
                        + the value of b is greater than 256 or 
                        + a number that is at least 8 bits long
"""
import os
import sys

argv = sys.argv[1:]
argc = len(argv)

def square_and_multiply(a,b,p):
    """
    Compute a^b (mod p)

    :: Params
    a : Base value
        Type: int
    b : Exponent/Power
        Type: int
    p : Modulus
        Type: int
    """
    return (a ** b) % p

def fast_exponentiation(a,b,p):
    """
    Implement fast exponentiation method via the Square and Multiply Techique

    a^b (mod p) == N^p (mod p)

    1. Convert b into Binary
    2. Convert binary b into S and X notations by splitting into a list and substituting accordingly
    3. Remove the first SX
    4. Compute according to sequence
    """
    ### Steps
    print("Pre-Requisites: ")
    print("a : {}".format(a))
    print("b : {}".format(b))
    print("p : {}".format(p))
    print("")

    """
    1. Convert b into Binary
    """
    print("1. Converting b into binary...")
    b_binary = bin(b)[2:]
    b_binary_List = list(b_binary)
    print("Binary: {}".format(b_binary))
    print("")

    """
    2. Convert binary b into S and X notations by splitting into a list and substituting accordingly
    """
    print("2. Converting binary b into S and X notations...")
    print("Old Binary list b: {}".format(b_binary_List))
    for i in range(len(b_binary_List)):
        """ 
        Convert the binary b into a list and 
        Loop through all of the indexes and
        Substitute
            - If '1': Replace with SX
            - If '0': Replace with S
        """
        curr_bit = b_binary[i]
        if curr_bit == "1":
            print("Replacing {} with {}".format(curr_bit, "SX"))
            b_binary_List[i] = "SX"
        elif curr_bit == "0":
            print("Replacing {} with {}".format(curr_bit, "S"))
            b_binary_List[i] = "S"
        else:
            print("Invalid bit [{}], skipping...".format(curr_bit))

    print("New Binary list b: {}".format(b_binary_List))
    print("")

    """
    3. Remove the first SX
    """
    print("3. Removing the first 'SX'")
    b_binary_List.remove("SX")
    print("New Binary list b: {}".format(b_binary_List))
    print("")

    """
    4. Compute according to sequence
    - For each S: compute Square mod p
    - For each X: Multiply with N mod P
    """
    print("4. Begin computing each S and SX...")
    res = 0
    equation = ""
    # Loop through all elements
    for i in range(len(b_binary_List)):
        # Get current element
        element = b_binary_List[i]

        # Check if result is empty (1st round)
        if res == 0:
            res = a
        # print("Starting result: {}".format(res))

        structure = "({})^2".format(res, p)
        # Square the result
        res = (res ** 2) % p

        # Check if element is "SX"
        if element == "SX":
            # If element is "SX": Multiply the result with the base (a) (mod p)
            res = res * a % p
            structure += " x {} mod {}".format(a, p)
            print("[{}] : {} = {}".format(element, structure, res))
        else:
            structure += " mod {}".format(p)
            print("[{}] : {} = {}".format(element, structure, res))

    print("")

    return res

def main():
    global a, b, p
    # Get CLI arguments
    if (argc == 3):
        a = argv[0]
        b = argv[1]
        p = argv[2]
    else:
        """
        No/Invalid arguments provided. Please provide the following:
            1. a : The Base value; Numerical Value
            2. b : The Exponent/Power; Numerical Value
            3. p : The Modulus/Modulo; Numerical Value
        """
        # Get user input
        a = input("Input a (Base): ")
        b = input("Input b (Exponent): ")
        p = input("Input Modulus p: ")

    # Check if all required values are populated
    if (len(a) != 0) and (len(b) != 0) and (len(p) != 0):
        # All required data are in
        print("Base : {}".format(a))
        print("Exponent : {}".format(b))
        print("Modulus : {}".format(p))
        a_int = int(a)
        b_int = int(b)
        p_int = int(p)
        print("")
        res = fast_exponentiation(a_int, b_int, p_int)

        # Print final result
        print("Final Result: {}".format(res))
    else:
        # Edge Case Validator
        print("""
        No/Invalid arguments provided. Please provide the following:
            1. a : The Base value; Numerical Value
            2. b : The Exponent/Power; Numerical Value
            3. p : The Modulus/Modulo; Numerical Value
              """)

if __name__ == "__main__":
    main()
