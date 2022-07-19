"""
Decryption using Symmetric Key Encryption (AES)
"""

# Built-in
import os
import sys

# Dependencies
from Crypto.Cipher import AES				# Encryption Algorithm; {AES}
from Crypto.Util.Padding import pad, unpad  # Pad data block into n bytes size (based on length of key)
from Crypto.Random import get_random_bytes  # Random Generation
from base64 import b64decode    			# Base 64 Encoding and Decoding

def symmetric_dec(enc_result):
	"""
	Symmetric Decryption with AES

	:: Params
	enc_result:
		Description: The result of the encryption containing a tuple/list of 3 values
			- iv, ct, key
		Type: List/Tuple

	:: steps
	- reverse of symmetric encryption()

	:: Notes
	- iv (Initial Vector) must be given for decryption
	- pt = Plaintext
	"""
	result = ""

	try:
		iv = b64decode(enc_result[0])
		ct = b64decode(enc_result[1])
		key = b64decode(enc_result[2])

		cipher = AES.new(key, AES.MODE_CBC, iv) # Generate a new AES cipher object of mode Chain Block Cipher using the key and initial vector
		pt = unpad(cipher.decrypt(ct), AES.block_size) # Get plaintext from unpadding the padded encrypted cipher text of the key length
		result = pt
	except ValueError:
		# print("Incorrect Decryption")
		result = "Incorrect Decryption"
	except KeyError:
		# print("Incorrect Key")
		result = "Incorrect Key"

	
	return pt


