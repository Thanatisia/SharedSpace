"""
Symmetric Key Encryption with AES
"""

# Built-in
import os
import sys

# Dependencies
from Crypto.Cipher import AES				# Encryption Algorithm; {AES}
from Crypto.Util.Padding import pad, unpad  # Pad data block into n bytes size (based on length of key)
from Crypto.Random import get_random_bytes  # Random Generation
from base64 import b64encode			    # Base 64 Encoding and Decoding

def random_key_gen(bytes_len):
    """
    Task 2 Qn 2 - Pycryptodome provides a random generation function that
    - can be used to generate random n bytes
    """
    key = get_random_bytes(bytes_len)
    return key

def symmetric_enc(secret_text, key):
	"""
	Symmetric Encryption with AES
	- Assumption
	1. Mode = CBC (Cipher Block Chaining)
	2. Block Size = 128 bits (16-bytes)
	- Steps
	1. Initialize AES object with CBC mode
	2. Pad data block into n bytes size based on length of key
	3. Encrypt the padded data
	- Additionals
	1. Outputs "iv" and "ct" are encoded using the base64 encoder
		- iv = Initial Vector
			+ Required for AES CBC mode
		- ct = Cipher Text
	"""
	# Variables
	ret_data = []

	# Get data
	data = secret_text.encode("utf-8")

	# Initialize new AES object with CBC mode
	cipher = AES.new(key, AES.MODE_CBC)
	ct_bytes = cipher.encrypt(pad(data, AES.block_size)) # Pad data block into 16 bytes size based on length of key

	# Encoding
	iv = b64encode(cipher.iv)   # Encode Initial Vector from Binary into string
	ct = b64encode(ct_bytes)    # Encode Cipher Text from Binary into string
	key = b64encode(key)        # Encode Key from Binary into string

	iv = iv.decode("utf-8")
	ct = ct.decode("utf-8")
	key = key.decode("utf-8")

	# Prepare Output
	ret_data = [iv, ct, key]

	return ret_data


