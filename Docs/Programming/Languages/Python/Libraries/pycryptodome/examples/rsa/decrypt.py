"""
Decryption using Public Key Encryption (RSA)
"""

# Built-in
import os
import sys

# Dependencies
from Crypto.PublicKey import RSA            # Utility to retrieve Public Key
from Crypto.Cipher import AES, PKCS1_OAEP   # Encryption Algorithm; {AES|PKCS1_0AEP}

def pke_decrypt(ciphertext):
	"""
	Public Key Encryption - Decryption function
	- Pycryptodome provides Public Key Encryption like RSA
	- using the private key to decrypt (private key is stored by attacker)

	:: Params
	ciphertext : The encrypted data you want to decrypt
		Type: string

	algo : Your algorithm to use
		Type: string
		Options: 
			- RSA
			- PKCS1 
	"""
	### Files

	# Keys
	attacker_key_file="out/attacker/private-key.bin"
	receiver_key_file="out/victim/public-key.bin"

	encrypted_file = "encrypted.bin"
	decrypted_file = "decrypted.txt"

	# Variables
	res = ""

	# Open encrypted file
	with open(encrypted_file, "rb") as read_enc:
		# Open file to read encrypted data
		private_key = RSA.import_key(open(attacker_key_file).read()) # Read the key from the Private Key owned by the attacker
		enc_data = read_enc.read(private_key.size_in_bytes()) # Read in encrypted data from encrypted file using the size of the private key (16-bytes as randomly generated)
		cipher_rsa = PKCS1_OAEP.new(private_key)
		plaintext = cipher_rsa.decrypt(enc_data)
		res = plaintext
		read_enc.close()

	# Write to plaintext file
	with open(decrypted_file, "w") as write_dec:
		# Write decrypted text
		write_dec.write(res.decode("utf-8"))
		write_dec.close()

	# Delete decrypted file
	os.remove(encrypted_file)

	return plaintext

