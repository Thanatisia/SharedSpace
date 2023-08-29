"""
- Lehman’s test
    - to implement the Lehman’s algorithm. 
        - The input to this program is a number, and 
            + your program will need to determine whether that number is a prime number or not. 
    - You need to display 
        + how many tests have been conducted and 
        + what are the random numbers that have been used for testing.
"""
import os
import sys
import random

argv = sys.argv[1:]
argc = len(argv)

def lehmann_primality(n, t): 
    """
    Lehmann Primality Test

    :: Params
    - n : Base Number
        + Type: Integer; Numerical
    - t : Number of Tries
        + Type: Integer; Numerical
    """
    # Initialize Variables
    res = -1

    # generating a random base less than n
    base = random.randint(2, n-1)

    # calculating exponent (power)
    e =(n-1)/2

    # iterate to check for different base values
    # for given number of tries 't'
    while(t>0):
        # calculating final value using formula [base^e % n]
        curr_val =((int)(base**e))% n

        # Get the Greatest Common Denominator (GCD) and check if is equals to 1
        # if not equal, try for different base
        if((curr_val % n)== 1 or (curr_val % n)==(n-1)):
            # Is not equals
            # Try base of order (n-1)
            base = random.randint(2, n-1)
            # Decrement number of tries
            t -= 1
            print("Test [{}]: {}".format(t, curr_val))
            # No errors
            res = 1
        else:
            # Errors encountered
            res = -1
            # Break loop
            break

    return res

def main():
    global n,t

    # Get CLI arguments
    if (argc == 2):
        n = argv[0]
        t = argv[1]
    else:
        """
        No/Invalid arguments provided. Please provide the following:
            1. n : The Base value; Numerical Value
            2. t : The number of tries; Numerical Value
        """
        # Get user input
        n = input("Input n (Base): ") # number to be tested
        t = input("Input t (Tries): ") # number of tries

    # Check if all required values are populated
    if (len(n) != 0) and (len(t) != 0):
        # All required data are in
        print("Base : {}".format(n))
        print("Tries: {}".format(t))
        n_int = int(n)
        t_int = int(t)
        print("")

        # if n is 2, it is prime
        if(n_int == 2):
            print("2 is Prime.")
            exit(0)

        # if even, it is composite
        if( (n_int % 2) == 0):
            print(n, "is Composite")
            exit(0)

        # if odd, check
        else:
            flag = lehmann_primality(n_int, t_int)

            print("")

            if(flag == 1):
                print(n, "may be Prime.")
            else:
                print(n, "is Composite.")

    else:
        # Edge Case Validator
        print("""
        No/Invalid arguments provided. Please provide the following:
            1. n : The Base value; Numerical Value
            2. t : The Number of Tries; Numerical Value
              """)


if __name__ == "__main__":
    main()
