"""
Encryption using Public Key Encryption (RSA)
"""
# Built-in
import os
import sys

# Dependencies
from Crypto.Random import get_random_bytes  # Random Generation
from Crypto.PublicKey import RSA            # Utility to retrieve Public Key
from Crypto.Cipher import PKCS1_OAEP   # Encryption Algorithm; {AES|PKCS1_0AEP}

def pke_encrypt(plaintext):
	"""
	Public Key Encryption
	- Pycryptodome provides Public Key Encryption like RSA
	- using the public key to encrypt (public key is stored by victim)

	:: Params
	plaintext : The secret/data you want to encryption
		Type: string

	algo : Your algorithm to use
		Type: string
		Options: 
			- RSA
			- PKCS1

	mode : Encryption/Decryption
		Type: String
		Options:
			- encryption
			- decryption
	"""
	### Files
	attacker_key_file="out/attacker/private-key.bin"
	receiver_key_file="out/victim/public-key.bin"
	encrypted_file = "encrypted.bin"

	"""
	Using RSA class to generate public and private key pair
	:: Steps
	1. Generate a public and private key pair for RSA
	"""
	# Public & Private Keys
	key = RSA.generate(2048) # Generate Public and Private Key Pair for RSA of size 2048-bits
	private_key = key.export_key()  # Get Private Key from Key Pair

	# Open key file to write the private key (kept by attacker)
	with open(attacker_key_file, "wb") as write_key: 
		write_key.write(private_key)
		write_key.close()

	public_key = key.publickey().export_key()   # Get Public Key from Key Pair

	# Open key file to write the public key (kept by victim)
	with open(receiver_key_file, "wb") as write_key:
		write_key.write(public_key)
		write_key.close()

	"""
	Using RSA version [PKCS #1 OAEP] for Encryption/Decryption

	:: Steps
	1. Read the public key from "receiver-key.bin" aka public key bin file
	2. Generate random 16-bytes key and
	3. Encrypt the plaintext using RSA algorithm
	"""
	recipient_key = RSA.import_key(open(receiver_key_file).read()) # Import in the Receiver's key file owned by the victim (Receiver - Public)
	data = plaintext.encode("utf-8") # Encode the plaintext string into bytes/binary
	# Open file to write encrypted data
	with open(encrypted_file, "wb") as file_enc: 
		cipher_rsa = PKCS1_OAEP.new(recipient_key) # Generate new RSA PKCS1_OAEP cipher object
		enc_data = cipher_rsa.encrypt(data) # Encrypt plaintext using the cipher object into a ciphertext
		file_enc.write(enc_data)
		file_enc.close()
	return enc_data


