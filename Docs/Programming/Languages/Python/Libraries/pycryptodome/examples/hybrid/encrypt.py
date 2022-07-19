"""
Hybrid Encryption with AES and RSA
"""

# Built-in
import os
import sys

# Dependencies
from Crypto.Cipher import AES				# Encryption Algorithm; {AES}
from Crypto.Util.Padding import pad, unpad  # Pad data block into n bytes size (based on length of key)
from Crypto.Random import get_random_bytes  # Random Generation
from base64 import b64encode			    # Base 64 Encoding and Decoding
from Crypto.PublicKey import RSA            # Utility to retrieve Public Key
from Crypto.Cipher import PKCS1_OAEP   # Encryption Algorithm; {AES|PKCS1_0AEP}

def random_key_gen(bytes_len):
    """
    Task 2 Qn 2 - Pycryptodome provides a random generation function that
    - can be used to generate random n bytes
    """
    key = get_random_bytes(bytes_len)
    return key

def hybrid_enc():
	"""
	Hybrid Encryption using both AES and RSA
	"""
	### Files
	public_key = "receiver.key"
	encrypted_file = "encrypted.bin"
	target_file = "file.txt"
	ciphertext_file = "file.enc"

	# Generate a random symmetric key
	key = get_random_bytes(16)

	print("Key : {}".format(key))

	# Write Public (Symmetric) Key
	with open(public_key, "w") as write_public_Key:
		write_public_Key.write(key)
		write_public_Key.close()

	# Encrypt the Symmetric Key
	recipient_key = RSA.import_key(open(public_key).read()) # Import the Symmetric Key and Encrypt using RSA
	with open("encrypted_key.bin", "wb") as encrypt_key:
		cipher_rsa = PKCS1_OAEP.new(recipient_key)
		enc_data = cipher_rsa.encrypt(key)
		encrypt_key.write(enc_data)
		encrypt_key.close()
	
	# Encrypt the message
	with open(target_file, "rb") as read_target_file:
		# Open a target file for encryption
		data = read_target_file.read()
		read_target_file.close()
	cipher = AES.new(key, AES.MODE_CBC)
	ct_bytes = cipher.encrypt(pad(data,AES.block_size))

	# Store Ciphertext for Decryption
	with open(ciphertext_file, "wb") as write_ciphertext:
		write_ciphertext.write(ct_bytes)
		write_ciphertext.close()
	iv = b64encode(cipher.iv).decode("utf-8")

	return iv


