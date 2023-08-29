"""
- Collision Finding of Hash Functions
    - SHA-1 is a commonly used hash function. It produces 160-bit hash value. 
        - You can download the source code for SHA-1 from the web, 
            + but you need to state where you get the original code from. 
            + As an example, see this github: https://github.com/clibs/sha1

    - A good hash function should be collision-resistant, 
        + meaning that it is difficult to find two messages, m and m’, where m ̸= m′, such that H(m) = H(m′). 

    - In this task, we assume a simplified version of SHA-1, named SSHA-1, is used for hashing. 
        + SSHA-1 only outputs 34 bits, which are composed from the first 17 bits and the last 17 bits of SHA-1 when hashing a message.

    - Find a pair of integers (x, x′) 
        + such that x != x′ but the SSHA-1 hash values of the following two messages are the same.
        - Examples
            + Barak Obama owes [FIRSTNAME] x dollars
            + Barak Obama owes [FIRSTNAME] x’ dollars
            + You should replace [FIRSTNAME] with your first name. 

    - Requirements
        - Your program should output 
            + the two messages, 
            + their hash values (should be the same), and 
            + the number of trials your program has made before it finds the collision.

:: Notes
- Generating random pair (x,x'):
    - Perform a while loop to generate integer pair (x,x')
        + Check if the integers x_1 and x_2 are the same: Regenerate again until x_1 and x_2 are different

:: Ideas
- Use Hash Table to detect Hash Collision
"""
import os
import sys
import math
import random
import hashlib
from hashlib import sha1

argv = sys.argv[1:]
argc = len(argv)

def generate_pair_of_Integers(min, max):
    """
    find a pair of integers (x, x′) 
        + such that x != x′ but the SSHA-1 hash values of the following two messages are the same.
        - Examples
            + Barak Obama owes [FIRSTNAME] x dollars
            + Barak Obama owes [FIRSTNAME] x’ dollars
            + You should replace [FIRSTNAME] with your first name. 

    :: Params
    - min : The minimum/lower bound number in the randomization pool
        Type: Integer
    - max : The maximum/upper bound number in the randomization pool
        Type: Integer

    :: Output
    - x_1 : First integer (x) of the pair of integers (x, x') used to detect if hash collision is found by comparing this with x_2
        - Type: Integer
    - x_2 : Second integer (x') of the pair of integers (x, x') used to detect if hash collision is found by comparing this with x_1
        - Type: Integer
    """
    print("Minimum: {}".format(min))
    print("Maximum: {}".format(max))

    # Generate pair of integers such that x != x′ but the SSHA-1 hash values of the following two messages are the same.
    x_1 = random.randint(min, max)
    x_2 = random.randint(min, max)

    print("Generated x: {}".format(x_1))
    print("Generated x': {}".format(x_2))

    # Return pair of integers
    return [x_1, x_2]

def ssha1(msg):
    """
    Implement a simplified version of SHA-1 used for hashing

    :: Requirements
    - SSHA-1 only outputs 34 bits, which are composed from 
        + the first 17 bits and 
        + the last 17 bits of SHA-1 when hashing a message.
    """
    # Initialize Variables
    res = []

    # Hash the message string using SHA1
    hash_obj = sha1(msg.encode("utf-8"))

    print("")

    # Convert the hash object into a hex digest
    hash_hex = hash_obj.hexdigest()
    # print("Hash hex digest: {}".format(hash_hex))

    # Split the hash hexdigest output into a list
    hash_list = list(hash_hex)
    # print("Hash hex digest list: {}".format(hash_list))

    # Obtain the first 17-bits
    hash_first_17_bits = hash_list[:17]
    # print("First 17 bits of string hash hexdigest: {}".format(hash_first_17_bits))
    # print("Size: {}".format(len(hash_first_17_bits)))

    # Obtain the last 17-bits
    hash_last_17_bits = hash_list[::-1][:17][::-1] # Inverse and obtain the first 17-bits
    # print("Last 17 bits of string hash hexdigest: {}".format(hash_last_17_bits))
    # print("Size: {}".format(len(hash_last_17_bits)))

    # Append and prepare return list containing the first and last 17-bits of the hash hexdigest
    res.append(''.join(hash_first_17_bits))
    res.append(''.join(hash_last_17_bits))

    # Return 
    return res

def detect_collisions(first_name, min=0, max=10):
    """
    Compare the pair of integers x_1 and x_2
        - such that x != x′ but the SSHA-1 hash values of the following two messages are the same.
            - Check if the integers x_1 and x_2 are the same: Regenerate again until x_1 and x_2 are different
        - Examples
            + Barak Obama owes [FIRSTNAME] x dollars
            + Barak Obama owes [FIRSTNAME] x’ dollars
            + You should replace [FIRSTNAME] with your first name. 

    :: Notes
    - Use Hash Table to store hashes as they are derived, check if it exists in the table

    :: Params
    - first_name : Your first name
        Type: String
    """
    # Initialize Variables
    x_1 = 0
    x_2 = 0
    x_1_msg = ""
    x_2_msg = ""
    x_1_msg_Hash = ""
    x_2_msg_Hash = ""
    collision_Flag = False
    res = []
    rotation_number = 0
    hash_Table = {} # Hash Table to store hashes, check with this to check if they exists; {"hash" : [x,x']}

    # While collision has not been found
    while (collision_Flag == False):
        print("")
        print("Rotation Number [{}]:".format(rotation_number))
        print("")

        # Reset x_1 and x_2
        x_1 = 0
        x_2 = 0

        # Keep looping until a pair of integers where (x!=x') is found
        while (x_1 == x_2):
            # Generate pair of integers such that x != x′ but the SSHA-1 hash values of the following two messages are the same.
            x_1, x_2 = generate_pair_of_Integers(min, max)

            # Check if x == x'
            if x_1 != x_2:
                # Not Equals
                break
            else:
                # Equals
                # Regenerate
                print("[{},{}] are equals, regenerating...".format(x_1,x_2))

        # Set messages
        x_1_msg = "Barak Obama owed {} {} dollars".format(first_name, x_1)
        x_2_msg = "Barak Obama owed {} {} dollars".format(first_name, x_2)

        # Hash the messages
        x_1_msg_Hash = ''.join(ssha1(x_1_msg))
        print("x  Message Size: {}".format(len(x_1_msg_Hash)))
        print("x  Message     : {}".format(x_1_msg))
        print("x  Message Hash: {} => {}".format(x_1_msg, x_1_msg_Hash))
        x_2_msg_Hash = ''.join(ssha1(x_2_msg))
        print("x' Message Size: {}".format(len(x_2_msg_Hash)))
        print("x' Message     : {}".format(x_2_msg))
        print("x' Message Hash: {} => {}".format(x_2_msg, x_2_msg_Hash))

        print("")

        """
        # Check if Hash and Message of X or X' are in the Hash Table
        if not (x_1_msg_Hash in hash_Table.keys()):
            # Hash not in dictionary
            # Store the Hash and Message in a Hash Table
            # - key = Hash
            # - value = Message string
            hash_Table[x_1_msg_Hash] = x_1_msg
        elif not (x_2_msg_Hash in hash_Table.keys()):
            # Hash not in dictionary
            # Store the Hash and Message in a Hash Table
            # - key = Hash
            # - value = Message string
            hash_Table[x_2_msg_Hash] = x_2_msg
        else:
        """

        """
        Check if Hash and Message of X or X' are in the Hash Table
        """
        if not (x_1_msg_Hash in hash_Table.keys()):
            # x Hash not in Hash Table
            # Store the Hash and Message in a Hash Table
            # - key = Hash
            # - value = Message string
            print("Hash [{}] is not in x".format(x_1_msg_Hash))

            # Check if hash is in the hash table key
            if not (x_1_msg_Hash in hash_Table.keys()):
                # Initialize Table Entry
                hash_Table[x_1_msg_Hash] = {"message": "", "round": {"x": [], "x'": []}}

            # Append message to "message" subkey
            hash_Table[x_1_msg_Hash]["message"] = x_1_msg

        if not (x_2_msg_Hash in hash_Table.keys()):
            # x' Hash not in Hash Table
            # Store the Hash and Message in a Hash Table
            # - key = Hash
            # - value = Message string
            print("Hash [{}] is not in x'".format(x_2_msg_Hash))

            # Check if hash is in the hash table key
            if not (x_2_msg_Hash in hash_Table.keys()):
                # Initialize Table Entry
                hash_Table[x_2_msg_Hash] = {"message": "", "round": {"x": [], "x'": []}}

            # Append message to "message" subkey
            hash_Table[x_2_msg_Hash]["message"] = x_2_msg

        """
        Append current round to x's and x' "round" subkey
        """
        # Append current round to x_1's "round" subkey
        hash_Table[x_1_msg_Hash]["round"]["x"].append(rotation_number)
        print("x  Current Entry: {}".format(hash_Table[x_1_msg_Hash]))

        # Append current round to x_2's "round" subkey
        hash_Table[x_2_msg_Hash]["round"]["x'"].append(rotation_number)
        print("x' Current Entry: {}".format(hash_Table[x_2_msg_Hash]))

        print("")

        # Confirm the 2 messages x and x' are in the hash table
        if (x_1_msg_Hash in hash_Table.keys()) and (x_2_msg_Hash in hash_Table.keys()):
            # Found in table
            # print("Hashes [{},{}] found in Hash Table".format(x_1_msg_Hash, x_2_msg_Hash))
            print("Hashes found in Hash Table")
            print(f"Hash x  : {x_1_msg_Hash}")
            print(f"Hash x' : {x_2_msg_Hash}")

            print(len(hash_Table))

            # List all hashes in hash table
            for k,v in hash_Table.items():
                print("{} => {}".format(k,v))

            # Check if the entry is generated by x_1 or x_2

            # Append current round to x_1's "round" subkey
            # hash_Table[x_1_msg_Hash]["round"]["x"].append(rotation_number)

            # Append current round to x_2's "round" subkey
            # hash_Table[x_2_msg_Hash]["round"]["x'"].append(rotation_number)

            # Check Break conditions
            if (x_1_msg_Hash == x_2_msg_Hash):
                # Check Break condition: If (H(M) == H(M'))
                # Break condition met
                print("Collision Found with [{},{}].".format(x_1, x_2))
                # Set Collision Flag to True
                collision_Flag = True
                break
            elif (len(hash_Table) == (max + 1)):
                # Check Exit condition: If the length of hash table is equals to (max+1) because of 0-index
                print("")
                print("Maximum reached, values appear to be repeating, Exiting...")
                break

        print("")

        """
        # Compare x_1 and x_2 and Check 
        if (x_1_msg_Hash == x_2_msg_Hash):
            # Break condition: If (x == x')
            print("Collision Found with [{},{}].".format(x_1, x_2))
            # Set Collision Flag to True
            collision_Flag = True
        else:
            print("Collision not found with [{},{}].".format(x_1, x_2))
        """

        # Increment rotation number
        rotation_number += 1

    # Set Result to return
    res = [collision_Flag, rotation_number, x_1_msg_Hash, x_2_msg_Hash, x_1_msg, x_2_msg]
    return res

def main():
    """
    # Get CLI arguments
    if (argc == 1):
        msg = argv[0]
    else:
        # No/Invalid arguments provided. Please provide the following:
        #    1. message : The plaintext string you wish to hash with SSHA-1
        # Get user input
        msg = input("Input the message string you wish to hash with SSHA-1")

    # Check if all required values are populated
    if (len(msg) != 0):
        # All required data are in
        print("Message String: {}".format(msg))
        print("")
    else:
        # Edge Case Validator
        print(
        No/Invalid arguments provided. Please provide the following:
            1. message : The plaintext string you wish to hash with SSHA-1
              )
    """
    # Get CLI arguments
    if (argc == 3):
        first_Name = argv[0]
        min = argv[1]
        max = argv[2]
    else:
        # Get user input
        first_Name = input("First Name: ")
        min = input("Minimum/Upperbound Value: ")
        max = input("Maximum/Upperbound Value: ")

    # Check if all required values are populated
    if (len(first_Name) != 0) and (len(min) != 0) and (len(max) != 0):
        # All required data are in
        print("First Name: {}".format(first_Name))
        print("Minimum: {}".format(min))
        print("Maximum: {}".format(max))
        print("")
    else:
        # Edge Case Validator
        first_Name = "Your-First-Name-Here"

    # Polymorphism/Data Type conversion
    min = int(min)
    max = int(max)

    # Begin generating pair of integers and detecting hash collisions
    print("Detecting Hash Collisions...")
    collision_Flag, number_of_Trials, x_1_msg_Hash, x_2_msg_Hash, x_1_msg, x_2_msg = detect_collisions(first_Name, min, max)

    print("")

    print("Number of Trials: {}".format(number_of_Trials))
    print("Collision: {}".format(collision_Flag))

    if collision_Flag:
        # Collided
        print("""Message [{}] hashed with SSHA-1: {}\nMessage [{}] hashed with SSHA-1: {}""".format(x_1_msg, x_1_msg_Hash, x_2_msg, x_2_msg_Hash))
    else:
        # No collision
        print("No Collision detected.")

if __name__ == "__main__":
    main()
