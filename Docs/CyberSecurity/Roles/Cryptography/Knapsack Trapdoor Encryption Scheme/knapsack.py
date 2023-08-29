"""
- Implementation of Trapdoor Knapsack Encryption Scheme
        - When the program is run, 
            + it first asks for the size of the super-increasing knapsack, 
            + then the user is asked to enter the value of each ai in the private key. 
            + Then, the user is asked to enter a modulus, follows by a multiplier. 
        - You will need to check whether condition of the multiplier is satisfied. 
            + Then, the public key will be generated and shown. 
        - Now, a set of message is being asked, 
            + and the ciphertext will need to be displayed. 
        + Finally, a ciphertext will need to be asked and the correct decryption of the ciphertext will need to be displayed.

:: Notations
- Private Key = Knapsack
- Public Key = Generated from the Private Key using modulus transformation by multiplying each value in the Knapsack with the multiplier and mod-ing with the modulus
"""
import os
import sys
import math

argv = sys.argv[1:]
argc = len(argv)

"""
General Utilities
"""
def convert_element_types(target_list, target_Type):
    """
    Convert all elements in a list to the specified target type

    :: Params
    - target_list : The list you wish to go through and change the type to the target type
        Type: List
    - target_Type : The target typing you wish to change all the elements of the list to
        Type: List
    """
    for i in range(len(target_list)):
        # Get current element
        curr_element = target_list[i]

        # Convert type to target type
        new_element = target_Type(curr_element)

        # Replace element into list
        target_list[i] = new_element

    return target_list


def convert_string_to_bin(plaintext_str):
    """
    Convert string values into the binary equivalent using ASCII encoding
    """
    plaintext_bin = ""
    ascii_bin = []

    # Convert string into ASCII characters and then into the BIN value
    for character in plaintext_str:
        ascii_bin.append(format(ord(character), '08b'))

    # Join the ascii together
    # plaintext_bin = ' '.join(ascii_bin)
    plaintext_bin = ''.join(ascii_bin)
    return plaintext_bin

def split_string_to_n_groups(msg, n, delimiter=""):
    """
    Split a string into groups of size N according to delimiter

    :: Params
    n = Group size; Number of elements per group
        Type: Integer
    delimiter = Separator
        Type: Character/String
    """
    i = 0
    res = []

    # While the current index is less than the string size
    while(i < len(msg)):
        # Split message string into blocks of size (i <= msg; i+n) blocks
        curr_block = msg[i:i+n]

        # Append string into list
        res.append(curr_block)

        # Increment current index by n times
        i += n
    return res

"""
Cryptographical
"""
def extended_euclidean_algorithm(a, b):
    """
    Apply Extended Euclidean Algorithm to determine if the values a and b have a GCD of 1 (Relatively Prime)
    """
    x, prev_x = 0, 1
    y, prev_y = 1, 0

    # While value b is not empty
    while b != 0:
        # Calculate the Quotient of (a/b)
        quotient = a // b
        # Shift a_1 with b_1, and b_1 with (a_2 % b_2)
        a, b = b, a % b
        # Shift x_1 with (x_2 - quotient * x_1), and x_2 with x_1
        x, prev_x = prev_x - quotient * x, x
        # Shift y_1 with (y_2 - quotient * y_1), and y_2 with y_1
        y, prev_y = prev_y - quotient * y, y

    return a, prev_x, prev_y

def multiplicative_inverse(modulus, multiplier):
    """
    Perform Multiplicative Inverse to inverse and decrypt the value 'a'

    :: Parameters
    - multiplier : The multiplier required to find the Multiplicative Inverse of
        Type: Integer
    - modulus: The prime modulus (p) used for modular transformation
        Type: Integer
    """
    gcd, x, y = extended_euclidean_algorithm(multiplier, modulus)
    if gcd != 1:
        raise ValueError("The multiplicative inverse does not exist.")
    else:
        return (x % modulus + modulus) % modulus

def validate_multiplier(private_Key, modulus, multiplier):
    """
    Check if condition of multiplier is satisfied
        - The value of the modulus must be greater than the sum of all values in the private key (Knapsack)
        - and The multiplier should have no common factor with the modulus (GCD(multiplier,modifier) == 1)
            + Summary: Must be Prime

    :: Parameters
    - private_Key : The private key owned by the user for the Trapdoor Knapsack Encryption Scheme; Generally is the Kanspack
        Type: List
    - multiplier : The multiplier to be validated
        Type: Integer
    - modulus: The prime modulus (p) used for modular transformation
        Type: Integer
    """
    res = 0
    # if (1<= multiplier) and (multiplier <= modulus-1):
        # 1 <= Multiplier <= (Modulus-1)
    if (modulus > sum(private_Key)) and (math.gcd(modulus,multiplier) == 1):
        # The value of the modulus must be greater than the sum of all values in the private key (Knapsack) AND
        # The multiplier should have no common factor with the modulus (GCD(multiplier,modifier) == 1)
        res = 1

    return res

def generate_public_Key(private_Key, modulus, multiplier):
    """
    Generate public key for Trapdoor Knapsack Encryption Scheme to be used for Encryption by transforming using Modulus Transformation

    :: Steps
    - Loop through all values of the Knapsack (Private Key)
        - Multiply all the values by the multiplier and Mod by the modulus
            - The value of the modulus must be greater than the sum of all values in the private key (Knapsack)
            - and The multiplier should have no common factor with the modulus (GCD(multiplier,modifier) == 1)
                + Summary: Must be Prime

    :: Parameters
    private_Key : The private key owned by the user for the Trapdoor Knapsack Encryption Scheme; Generally is the Kanspack
        + Type: List
    """
    pub_key = []

    for val in private_Key:
        # Multiply all the values by the multiplier and Mod by the modulus
        transformed_val = (val * multiplier) % modulus
        # Add the transformed value into the Public Key List
        pub_key.append(transformed_val)

    return pub_key

def encrypt(pub_key, knapsack_size, plaintext):
    """
    Encrypt plaintext message using the Public Key generated by for the Trapdoor Knapsack Encryption Scheme

    :: Params
    - pub_key : The public key generated from private key used to Encrypt
        Type: List
    - knapsack_size : The size of the superincreasing knapsack
        Type: Integer
    - plaintext : The target plaintext you want to encrypt
        Type: String

    :: Steps
    - Split the plaintext into groups of size [size of knapsack]
    - Multiply each values of the public key with the corresponding element of each group
        - Take their sum
            - This is the ciphertext
    """
    # Initialize Variables
    res = []
    plaintext_Split = []
    ciphertext = ""

    # Convert plaintext string into binary
    plaintext_Bin = convert_string_to_bin(plaintext)
    print("plaintext binary: {} => {}".format(plaintext, plaintext_Bin))

    # Split the plaintext into groups of size [size of knapsack]
    plaintext_Split = split_string_to_n_groups(plaintext_Bin, knapsack_size)

    """
    Multiply each values of the public key with the corresponding element of each group
        - Take their sum
            - This is the ciphertext
    """
    # Loop through all characters
    for i in range(len(plaintext_Split)):
        # Get current plaintext value
        curr_plaintext_Value = plaintext_Split[i]
        print("Current Plaintext Value: {}".format(curr_plaintext_Value))

        # Reset temporary sum
        tmp_sum = 0

        # Loop through all values of the public key and plaintext (binary list) knapsack_Size number of times
        for j in range(len(curr_plaintext_Value)):
            # Get current key value
            curr_key_Value = pub_key[j]
            print("Current Key Value: {}".format(curr_key_Value))

            # Get current character
            curr_char = curr_plaintext_Value[j]

            # multiply with the current public key value
            print("{} x {}".format(curr_char, curr_key_Value))
            transformation = int(curr_char) * curr_key_Value

            # Sum the temporary sum with the transformation
            tmp_sum += transformation

            print("Transformed {} x {} => {}".format(curr_char, curr_key_Value, transformation))

        # Append the total into ciphertext output list
        res.append(str(tmp_sum))

        print("")

    # Join to obtain ciphertext
    ciphertext = ' '.join(res)

    return ciphertext

def decrypt(private_Key, ciphertext, modulus, multiplier):
    """
    Decrypt ciphertext message using the Knapsack (Private Key)

    :: Params
    - private_Key : The private key; also known as the Knapsack
        Type: List
    - ciphertext : The target ciphertext you want to decrypt
        Type: String
    - modulus: The prime modulus (p) used for modular transformation
        Type: Integer
    - multiplier : The multiplier to be used to decrypt via Multiplicative Inverse and Extended Euclidean Algorithm
        Type: Integer

    :: Steps
    - Split the ciphertext into groups of size [size of knapsack]
    - Find the 'multiplier^{-1}'
        - This is the Multiplicative Inverse of (multiplier % modulus)
            - multiplier x multiplier^{-1} % modulus
                - let multiplier = 131, modulus = 110
                    - 131 x multiplier^{-1} % 110 = 1
                    - multiplier^{-1} = 71
    - Multiply the Multiplicative Inverse with each block of the ciphertext list mod modulus
    - Make the sum of bits from the values of the private key
        - Solve the 'subset sum problem'
    """
    # Initialize Variables
    res = []
    ciphertext_Split = []
    new_plaintext = ""

    # Split ciphertext into blocks
    ciphertext_Split = ciphertext.split()
    print("Ciphertext: {}".format(ciphertext_Split))

    # Convert ciphertext strings to integers
    convert_element_types(ciphertext_Split, int)

    # Find the Multiplicative Inverse of (multiplier % modulus)
    mul_inv = multiplicative_inverse(modulus, multiplier)
    print("Multiplicative Inverse of ({},{}) = {}".format(multiplier, modulus, mul_inv))

    # Loop through all elements in ciphertext list block
    for i in range(len(ciphertext_Split)):
        # Initialize New Variables
        curr_plaintext_Bin = ""

        # Get current cipher
        curr_cipher = ciphertext_Split[i]

        """
        Calculate the plaintext by 
        - Solving the "subset sum problem": Multiply the Multiplicative Inverse with each block of the ciphertext list mod modulus
        """
        subset_sum_Pos = (curr_cipher * mul_inv) % modulus
        print("Current Block x Multiplicative Inverse: {}".format(subset_sum_Pos))

        # Loop backwards 
        # - starting from position (len(private_Key) - 1)
        # - Decrementing by 1 each time all the way to the last index
        for j in range((len(private_Key)-1), -1, -1):
            # Get current private key
            curr_prv_Key = private_Key[j]

            # Check if the current block's multiplicative inverse multiplication if more than or equals to current private key's value
            if subset_sum_Pos >= curr_prv_Key:
                # Is more than or equals to
                # Prepend with a '1' bit
                curr_plaintext_Bin = "1" + curr_plaintext_Bin
                # Decrement the subset sum value by the private key value
                subset_sum_Pos -= curr_prv_Key
            else:
                # Less than current previous key
                # Prepend with a '0' bit
                curr_plaintext_Bin = "0" + curr_plaintext_Bin

        # Pad the binary string with zeros in the beginning 
        # - If the length of the binary is insufficient (Less than the length of the private key)
        while (len(curr_plaintext_Bin) < len(private_Key)):
            # Pad with zero
            curr_plaintext_Bin = "0" + curr_plaintext_Bin

        # Loop through all characters in the current plaintext binary string
        for j in range(0, len(curr_plaintext_Bin), 8):
            # Get current character over 8 bits
            curr_plaintext_Character = int(curr_plaintext_Bin[j:j+8], 2)

            # Convert the binary string back to ASCII and into plaintext string
            curr_plaintext_char_ASCII = chr(curr_plaintext_Character)

            # Append new plaintext ASCII into list
            res.append(curr_plaintext_char_ASCII)

    # Concatenate/Join new plaintext string together
    new_plaintext = ''.join(res)

    print("Result: {}".format(res))

    return new_plaintext

def trapdoor_knapsack_encryption_scheme(size, value, modulus, multiplier):
    """
    Trapdoor Knapsack Encryption Scheme

    :: Notes
    - Trapdoor = One-way Function
    """
    res = ""

    # Split the Superincreasing knapsack from string into list
    knapsack = value.split(",")
    # Convert all values of knapsack into integers
    for i in range(len(knapsack)):
        element = knapsack[i]
        knapsack[i] = int(element)

    print("Size of Knapsack: {}".format(size))
    print("Knapsack: {}".format(knapsack))
    print("Modulus: {}".format(modulus))
    print("Multiplier: {}".format(multiplier))
    print("")

    # Validate if condition of Multiplier is satisfied
    print("1. Validating condition of Multiplier is satisfied...")
    condition_flag = validate_multiplier(knapsack, modulus, multiplier)

    if (condition_flag == 1):
        # Valid
        print("Multiplier condition is valid.")

        print("")

        # Generate the public key and shown. 
        print("2. Generating public key...")
        pub_Key = generate_public_Key(knapsack, modulus, multiplier)
        print("Public Key: {}".format(pub_Key))

        print("")

        # Obtain plaintext message from user
        print("3. Obtaining a plaintext message to encrypt...")
        plaintext = input("Please input a message to encryption: ")

        # Check if plaintext is empty
        if (plaintext != ""):
            # Not empty
            print("3.1. Encrypting plaintext...")
            # Encrypt plaintext message into ciphertext using the Public Key
            ciphertext = encrypt(pub_Key, size, plaintext)

            # Print out ciphertext
            print("Encrypted Ciphertext: {}".format(ciphertext))
            res = ciphertext
        else:
            print("Plaintext is not provided.")

        print("")

        # Obtain ciphertext from user
        print("4. Obtaining a ciphertext message to decrypt...")
        ciphertext = input("Please input a ciphertext to decrypt: ")

        # Check if ciphertext is empty
        if (ciphertext != ""):
            # Not empty
            # Decrypt ciphertext message into plaintext using the Knapsack (Private Key)
            plaintext = decrypt(knapsack, ciphertext, modulus, multiplier)

            # Print out ciphertext
            print("Decrypted Plaintext: {}".format(plaintext))
        else:
            print("Ciphertext is not provided.")
    else:
        # Invalid
        print("Multiplier condition is invalid.")
        exit(1)

    return res

def main():
    # Get CLI arguments
    if (argc == 4):
        size = argv[0]
        value = argv[1]
        modulus = argv[2] 
        multiplier = argv[3]
    else:
        """
        No/Invalid arguments provided. Please provide the following:
            1. size : The Size of the Super-increasing Knapsack; Numerical
            2. value: Value of each a_i in the private key; Will be used as the Private Key
                Type: String
                Values: Please separate all values with a ',' delimiter
            3. modulus: A modulus for shrinking; Numerical
            4. multiplier: A multiplier; Numerical
        """
        # Get user input
        size = input("Input size of the Super-increasing knapsack (Numerical): ") # Size of the super-increasing knapsack
        value = input("Input value of each a_i in the private key (String) (Please separate all values with a ',' delimiter; i.e. 1,2,3,4,5,...): ") # Value of each a_i in the private key
        modulus = input("Input a modulus (Numerical): ")
        multiplier = input("Input a multiplier (Numerical): ")

    # Check if all required values are populated
    if (len(size) != 0) and (len(value) != 0) and (len(modulus) != 0) and (len(multiplier) != 0):
        # All required data are in
        print("Size: {}".format(size))
        print("Values: {}".format(value))
        print("Modulus: {}".format(modulus))
        print("Multiplier: {}".format(multiplier))
        size_int = int(size)
        value_int = str(value)
        mod_int = int(modulus)
        mul_int = int(multiplier)
        print("")

        trapdoor_knapsack_encryption_scheme(size_int, value_int, mod_int, mul_int)
    else:
        # Edge Case Validator
        print("""
        No/Invalid arguments provided. Please provide the following:
            1. size : The Size of the Super-increasing Knapsack; Numerical
            2. value: Value of each a_i in the private key; Will be used as the Private Key
                Type: String
                Values: Please separate all values with a ',' delimiter
            3. modulus: A modulus for shrinking; Numerical
            4. multiplier: A multiplier; Numerical
              """)

if __name__ == "__main__":
    main()
