"""
Hybrid Decryption using AES and RSA
"""

# Built-in 
import os
import sys

# Dependencies
from Crypto.Cipher import AES				# Encryption Algorithm; {AES}
from Crypto.Util.Padding import pad, unpad  # Pad data block into n bytes size (based on length of key)
from Crypto.Random import get_random_bytes  # Random Generation
from base64 import b64decode    			# Base 64 Encoding and Decoding
# Dependencies
from Crypto.PublicKey import RSA            # Utility to retrieve Public Key
from Crypto.Cipher import PKCS1_OAEP   # Encryption Algorithm; {AES|PKCS1_0AEP}

def hybrid_dec(iv):
	"""
	Hybrid Decryption
	- RSA part
	"""
	### Files
	private_key_file = "private.bin"
	encrypted_data_file = "encrypted_data.bin"
	ciphertext_file = "file.enc"

	### Variables
	res = ""

	# Decrypt the encrypted symmetric key
	with open("encrypted_key.bin", "rb") as read_encrypted:
		private_key = RSA.import_key(open(private_key_file).read())
		enc_data = read_encrypted.read(private_key.size_in_bytes()) # Read Encrypted Data
		cipher_rsa = PKCS1_OAEP.new(private_key) # Create new RSA cipher object
		data = cipher_rsa.decrypt(enc_data) # Decrypt the encrypted symmetirc key using the RSA cipher object
		read_encrypted.close()
	
	# Decrypt ciphertext
	try:
		# iv = b64decode("encrypted Initial Value")
		iv = b64decode(iv)
		with open(ciphertext_file, "rb") as read_ciphertext:
			# Open Ciphertext encrypted file to get ciphertexts
			ct = read_ciphertext.read()
			read_ciphertext.close()
		cipher = AES.new(key, AES.MODE_CBC, iv)
		pt = unpad(cipher.decrypt(ct), AES.block_size)
		res = pt
	except ValueError:
		# print("Incorrect Decryption")
		res = "Incorrect Decryption"
	except KeyError:
		# print("Incorrect Key")
		res = "Incorrect Key"
	
	return pt
