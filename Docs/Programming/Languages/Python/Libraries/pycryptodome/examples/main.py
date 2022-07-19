"""
Pycryptodome

Notes: 
- Modes
    - CBC : Cipher Block Chaining
- Variables
    - Crypto.Cipher.AES
        + iv : Get the Initial Vector from the AES cipher object
"""

# Built-in Libraries
import os
import sys

# External libraries
import aes.encrypt as aes_enc
import aes.decrypt as aes_dec
import rsa.encrypt as rsa_enc
import rsa.decrypt as rsa_dec
import hybrid.encrypt as hybrid_enc
import hybrid.decrypt as hybrid_dec

def main():
    # Main Runner
	"""
	Symmetric Key Encryption
	"""
	print("Encrypting using AES...")
	plaintext = "Hello World"
	key = aes_enc.random_key_gen(16) # Generate a random key of length/size n bytes
	enc_data = aes_enc.symmetric_enc(plaintext, key)
	print("Plaintext : {}".format(plaintext))
	print("Encrypted Data : {}".format(enc_data))

	print("")

	print("Decrypting using AES...")
	plaintext = aes_dec.symmetric_dec(enc_data).decode("utf-8")
	print("Plaintext : {}".format(plaintext))

	print("")

	"""
	Asymmetric / Public Key Encryption
	"""
	print("Encrypting using RSA...")
	plaintext = "Hello World"
	cipher = rsa_enc.pke_encrypt(plaintext)
	print("Plaintext : {}".format(plaintext))
	print("Cipher : {}".format(cipher))

	print("")

	print("Decrypting using RSA...")
	plaintext = rsa_dec.pke_decrypt(cipher)
	print("Plaintext : {}".format(plaintext.decode("utf-8")))

	print("")

	"""
	Hybrid Key Encryption
	"""
	print("Encrypting using Hybrid...")
	iv = hybrid_enc.hybrid_enc()

	print("")

	print("Decrypting using Hybrid...")
	hybrid_dec.hybrid_dec(iv)

	print("")
		

if __name__ == "__main__":
    main()

