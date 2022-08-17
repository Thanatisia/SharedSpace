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
    + Signature
    + Hash

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

#### Crypto.Hash
+ SHA256 : The SHA256 Hashing Algorithm

#### Crypto.PublicKey
+ DSA : A Digital Signature Algorithm
+ RSA : The Rivett-Shamir-Ackermann Asymmetric (Public) Key Encryption Algorithm

#### Crypto.Random
+ get_random_bytes

#### Crypto.Protocol
+ KDF

#### Crypto.Signature
+ DSS : Digital Signature Signing

### Functions
- Crypto.Cipher.AES
    + cipher_aes = .new(session_key, AES_MODE)				: Generate a new AES cipher object; Returns a new object of type <AES>
    + ciphertext, tag = cipher_aes.encrypt_and_digest(encoded_data)	: Encrypt the encoded data and Generate a digest (hashed data); Returns a tuple of 2 items - ciphertext (bytes) and MAC tag (bytes)

- Crypto.Cipher.PKCS1_0AEP
    + cipher_rsa = .new(recipient_key)					: Generate a new RSA cipher
    + enc_session_key = cipher_rsa.encrypt(session_key)			: Encrypt the session key with the Public RSA key
   
- Crypto.Hash.SHA256
    - hash_obj = SHA256.new(message)                    : Create a new SHA256 Hash object
        - Parameters
            - message : The message you want to hash
                + Type : Bytes
        + Return Type : SHA256Hash
   
- Crypto.PublicKey.DSA
    - DSAKey = DSA.construct(tup)                        : Construct the DSAKey object using the Public Key (y) and the Domain tuple (g,p,q)
        - Parameters
            - tup : The DSAKey object domain tuple (y,g,p,q) that you want to construct the DSAKey object with
                + Type : list
        - Return Type : DSAKey
    - DSAKey = DSA.generate(size, domain)
        - Parameters
            - size : The size of your DSAKey object in Bits (1024, 2048, 4096 etc.)
                + Type : integer
            - domain : The tuple containing a pre-existing DSAKey object domain (key.y, key.g, key.p, key.q); Generates a randomized DSAKey object Key of the specified size if domain is not provided
                + Type : tuple
        - Return Type : DSAKey
    - DSAKey = DSA.import_key(external_key_Bytes) : Import an external key and returns a DSAKey object
        - Parameters
            - external_key_Bytes : The external key you want to import
                + Type : Bytes object
        - Return Type : DSAKey
    
- Crypto.PublicKey.RSA
    + rsa_key = .generate(bits)						        : Generate a RSA key combo of 2048 bits
    + recipient_key = import_key(key_file)                  : Import an RSA Key from a file
    + private_key = rsa_key.exportKey()                     : Export Private Key from generated key
    + public_key = rsa_key.publickey()                      : Export Public Key from generated key

- Crypto.Random
    + session_key = Crypto.Random.get_random_bytes(size)	: Generate a random byte from a given size

- Crypto.Protocol.KDF
    + key = PBKDF2(password, salt, dkLen=[bytes])			: Generate a key of any length using PBKDF2 with salt and the plaintext
   
- Crypto.Signature.DSS
    - {verifier/signer} = .new(key, mode)                 : Create a new DSS Digital Signature Signer/verifier object using the provided DSA Key and the format
        - Parameters
            - Key : The DSAKey object you generated
                + Type : DSAKey
            - Mode : The signature format to generate the verifier/signer
                + Type : String
                - Options
                    + "fips-186-3"
                    + "fips-186-4"
        - Return Type : DssSigScheme
   
### Objects

#### Crypto.Hash.SHA256
- SHA256Hash
    - Attributes
        - oid : The ASN.1 Object ID
            + Type : String
        - block_size : The size of the internal message block, input to the compression function
            + Type : Integer
        - digest_size : The size of the resulting hash
            + Type : Integer
    - Functions
        - hash_Bytes = .digest() : Returns the binary (non-printable) digest of the message that has been hashed so far
            + Return Type : byte string
        - hash_Hex = .hexdigest() : Returns the printable Hexadecimal-value digest of the message that has been hashed so far
            + Return Type : Hexadecimal String
        - hash_obj = .new(message) : Create a new fresh SHA256 Hash object
            - Parameters
                - message : The message you want to hash
                    + Type : Bytes   
            + Return Type : SHA256Hash

#### Crypto.PublicKey
+ Key : Public key object

#### Crypto.PublicKey.RSA
- RSAKey

#### Crypto.PublicKey.DSA
- DSAKey
    - Attributes
        - DSAKey.y : Public Key
            + Type : Integer
        - DSAKey.g : Generator
            + Type : Integer
        - DSAKey.p : DSA Modulus
            + Type : Integer
        - DSAKey.q : Order of the Subgroup
            + Type : Integer
        - DSAKey.x : Private Key (OPTIONAL)
            + Type : Integer

#### Crypto.Signature.DSS
```
Can perform (EC)DSA Signature or Verification
```
- DssSigScheme
    - Functions
        - can_sign() : Checks if the signature object can be used for signing messages
            - Return Type : Boolean 
        - signature = sign(msg_hash) : Compute the DSA/ECDSA signature of a message (aka Sign the message hash with the verifier/signer) and Returns the Signature (as bytes)
            - Parameters
                - msg_hash : A Hashed Message's Hash; Refer to 'Crypto.Hash'
                    - Type : Hash
            - Return Type : bytes
        - verify(msg_hash, signature) : Checks if a certain (EC)DSA signature is authentic by comparing the Signature with the Secret message's hash
            - Parameters
                - msg_hash : A Hashed Message's Hash; Refer to 'Crypto.hash'
                    - Type : Hash
                - signature : The signature to be validated
                    - Type : bytes
            - Exceptions
                + ValueError : If the signature is not authentic/value of the signature hash does not match the hashed message
   
### Exceptions
#### Crypto.Signature.DSS.DssSigScheme
+ ValueError : If the signature is not authentic
   
### Variables
#### Crypto.Cipher.AES
+ MODE_CBC
+ MODE_EAX


### Usage

#### Encryption with RSA
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

#### Digital Signature Signing with DSA/S

    
## References
+ [Nitratine - Python Encryption and Decryption with Pycryptodome](https://nitratine.net/blog/post/python-encryption-and-decryption-with-pycryptodome/)
+ [Levelup Gitconnected - Substitution Encoder and Solver in Python](https://levelup.gitconnected.com/substitution-encoder-and-solver-in-python-19984a6b8d5d)

## Resources


## Remarks

