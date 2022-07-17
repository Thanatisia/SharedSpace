# Docs - Python Module : Pycryptodome

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Name: Pycryptodome
+ Package Type : Infosecurity
- Modules
    + Cipher
    + PublicKey
    + Random

## Setup

### Pre-Requisites

### Dependencies
- python
- pip

### Installation
- Using PyPi
    ```python
    python -m pip install pycryptodome
    ```

## Documentation

### Description
+ Pycryptodome is an almost drop-in replacement for the old PyCrypto library
+ All modules are installed under the "Crypto" package, thus the Prefix uses Crypto
+ Please do not have both PyCrypto and Pycryptodome installed as they conflict each other
+ There is a library independent of the old PyCrypto library called pycryptodomex that can coexist with PyCrypt

### Synopsis/Syntax

- Import the whole module
    + import Crypto.[module]

- Import classes
    + from Crypto.[module] import [class]

### Modules
+ Crypto.Cipher 	: All Symmetric Encryption Algorithms; Modules for protecting confidentiality (encrypting, decrypting data)
+ Crypto.Hash		: Hashing Algorithms; Modules for creating cryptographic (hash digests); Examples : SHA-256
+ Crypto.PublicKey	: All Asymmetric Encryption Algorithms; Modules for generating, exporting and/or importing public keys
+ Crypto.Random		: Modules for generating random data
+ Crypto.Util		: General purpose modules
+ Crypto.Signature	: Modules for assuring authenticity; Creating or Verifying digital signatures
+ Crypto.Protocol	: Modules for facilitating secure communications betwen parties
+ Crypto.IO		: Modules for dealing with encodings commonly used for cryptographic data; I.E. PEM

### Classes

#### Crypto.Cipher
+ AES
+ PKCS1_0AEP

#### Crypto.PublicKey
+ RSA

#### Crypto.Random
+ get_random_bytes

#### Crypto.Protocol
+ KDF

### Functions
- Crypto.Cipher.AES
    + cipher_aes = .new(session_key, AES_MODE)				: Generate a new AES cipher object; Returns a new object of type <AES>
    + ciphertext, tag = cipher_aes.encrypt_and_digest(encoded_data)	: Encrypt the encoded data and Generate a digest (hashed data); Returns a tuple of 2 items - ciphertext (bytes) and MAC tag (bytes)

- Crypto.Cipher.PKCS1_0AEP
    + cipher_rsa = .new(recipient_key)					: Generate a new RSA cipher
    + enc_session_key = cipher_rsa.encrypt(session_key)			: Encrypt the session key with the Public RSA key

- Crypto.PublicKey.RSA()
    + rsa_key = .generate(bits)						: Generate a RSA key combo of 2048 bits
    + recipient_key = import_key(key_file)				: Import an RSA Key from a file
    + private_key = rsa_key.exportKey()					: Export Private Key from generated key
    + public_key = rsa_key.publickey()					: Export Public Key from generated key

- session_key = Crypto.Random.get_random_bytes(size)			: Generate a random byte from a given size

- Crypto.Protocol.KDF
    + key = PBKDF2(password, salt, dkLen=[bytes])			: Generate a key of any length using PBKDF2 with salt and the plaintext

### Variables
#### Crypto.Cipher.AES
+ MODE_CBC
+ MODE_EAX


### Usage

- Storing a key
	```python
	from Crypto.Random import get_random_bytes
	
	key_location = "./my_key.bin" # A safe place to store the key

	# Generate the key
	key = get_random_bytes(32) # let the bytes be 32 of length 32

	# Save the key to a file
	with open(key_location, "wb") as write_key: # wb = write bytes
		write_key.write(key)
		write_key.close()

	# Assume you no longer have the key
	with open(key_location, "rb") as read_key: # rb = Read Bytes			
		key_from_file = read_key.read() # Should be the the same
		read_key.close()

	# (OPTIONAL) Verify the keys are the same
	assert key == key_from_file, "Keys do not matdch" # Will thrown an AssertionError if doesnt match
	```

- Generating a key from a plaintext / "password"
	```python
	from Crypto.Random import get_random_bytes
	from Crypto.Protocol.KDF import PBKDF2

	salt = get_random_bytes(32)
	password = input("Password: ") #  Get password from user input	

	key = PBKDF2(password, salt, dkLen=32) # Generate a key of any length using PBKDF2 with salt and the plaintext; Get the key that you can encrypt with; no need to store
	```

- Encrypting with PBKDF2 key
	- MODE CBC
		```python
		from Crypto.Cipher import AES
		from Crypto.Util.Padding import pad
	
		output_file = "encrypted.bin" 	# Output File
		data = b"your bytes data"	# Bytes object data
		key = b"your key"		# The encryption key you generated

		# Create cipher object and encrypt the data
		cipher = AES.new(key, AES.MODE_CBC)			# Create an AES cipher object with the key generated using the mode CBC
		ciphertext = cipher.encrypt(pad(data, AES.block_size))	# Pad the input data and then encrypt

		# Write ciphertext to file
		with open(output_file, "wb") as write_ciphertext: # Open file to write bytes
			write_ciphertext.write(cipher.iv) 	# Write the IV to the output file (will be required for decryption)
			write_ciphertext.write(ciphertext) 	# Write the varying length ciphertext to the file (this is the encrypted data)	
			write_ciphertext.close()
		```

- Encrypting with Substitution Cipher
	```python
	from Crypto.Cipher import AES
	from Crypto.Util.Padding import pad

	### Files
	file_path = "./"
	files = os.listdir(file_path)	
	output_file = "encrypted.bin" 	# Output File
	key_file = file_path + "key.bin"

	### Variables
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	plaintext = input("Data: ")	# Bytes object data
	key = "your key"		# The encryption key you generated

	# Encrypt data with Substitution Cipher
	for file in files:
		ciphertext = ""
		file_name = os.path.splitext(file)[0]
		file_ext = os.path.splitext(file)[1]
		if file_ext == ".txt":
			with open(file, "r") as f_read: # Open file to read
				plaintext = f_read.read()
				# Encrypt with substitution cipher
				for letter in plaintext:
					if letter.lower() in alphabet:
						ciphertext += key[alphabet.find(letter.lower())]
					else:
						ciphertext += letter

				# Write Encrypted ciphertext into file
				with open(file + ".bin", "wb") as f_enc: # Open file to encrypt and write into
					f_enc.write(ciphertext.encode("utf-8"))
					f_enc.close()
				f_read.close()

			# Delete original file after encrypting
			os.remove(file)

	# Write Key into key.bin
	with open(key_file, "wb") as write_key:
		write_key.write(key.encode("utf-8"))
		write_key.close()
	```

## References
+ [Nitratine - Python Encryption and Decryption with Pycryptodome](https://nitratine.net/blog/post/python-encryption-and-decryption-with-pycryptodome/)
+ [Levelup Gitconnected - Substitution Encoder and Solver in Python](https://levelup.gitconnected.com/substitution-encoder-and-solver-in-python-19984a6b8d5d)

## Resources


## Remarks

