import os
import sys

# Global Variables
alphabet_list = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

"""
Algorithms
"""
def substitution_cipher():
    """
    Substitution Cipher

    - Randomly shuffle to generate a cipher alphabet list and
    """ 
    # print("Alphabet List : {}".format(alphabet_list))

    # Shuffle the list randomly
    cipher_list = list(alphabet_list)
    random.shuffle(cipher_list)
    # print("Cipher List : {}".format(cipher_list))

    content = ""
    ciphertext = ""

    for char in content:
       # print("Current Letter : {}".format(char))
       # Scramble and substitute letters according to 
       # Cipherlist
       if char.upper() in alphabet_list:
          # Check if character is in the alphabet_list
          symbol_index = alphabet_list.find(char.upper()) # Find the current character in the alphabet list
          if char.isupper():
             # Is lower : Set to lower case
             # print("Key Character in Index {} : {}".format(symbol_index, key[symbol_index].upper()))
             ciphertext += key[symbol_index].upper()
          else:
             # Is Upper : Set to upper case
             # print("Key Character in Index {} : {}".format(symbol_index, key[symbol_index].lower()))
             ciphertext += key[symbol_index].lower()
        else:
          # Just add that character/symbol
          ciphertext += char

    # Check Ciphertext
    print("Contents : {}".format(ciphertext))

    
def main():
    """
    Main Runner
    """
    substitution_cipher()

if __name__ == "__main__":
    main()

