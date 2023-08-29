"""
Testing read of RSA Key into program
"""
import os
import sys
import random
import hashlib
import base64
import hmac
import pyaes
from hashlib import sha256
from Crypto import Random
from Crypto.Cipher import AES
from Crypto.Hash import SHA256
from Crypto.PublicKey import RSA
from Crypto.Random import get_random_bytes
from Crypto.Signature import pkcs1_15
from Crypto.Util.Padding import pad, unpad

file_message = "message.txt"
file_prv_key = "privateKey.txt"
file_pub_key = "publickey.txt"

class Ring:
    """
    Ring Signature Implementation using RSA Key Generation
    """
    def __init__(self, bit_Size:int=1024):
        self.l = bit_Size # Bit Size
        self.q = 1 << (bit_Size - 1) # x2 (bit_Size - 1) number of times by Left-bitwise shifting 

    def gen_key_pair(self, bit_Size=1024):
        # Generate a Public Key Pair of size [bit-size] with os.urandom as the randomizer
        key_pair = RSA.generate(bit_Size, os.urandom)

        # Extract exponent, private key and modulus
        exponent = key_pair.e
        private_key_d = key_pair.d
        modulus = key_pair.n

        # Prepare output
        out = {
            'e' : exponent,
            'd' : private_key_d,
            'n' : modulus
        }

        # Return
        return out

    def gen_public_key(self, bit_Size=1024):
        """
        Generate Public Key from a given Private Key
        """
        # Generate a Public Key Pair of size [bit-size] with os.urandom as the randomizer
        key_pair = RSA.generate(bit_Size, os.urandom)

        # Extract exponent, private key and modulus
        exponent = key_pair.e
        modulus = key_pair.n

        # Prepare output
        out = {
            'e' : exponent,
            'n' : modulus
        }

        # Return
        return out

    def crypto_hash(self, msg):
        """
        Cryptographically hash the message using SHA256
        """
        hash_hex = sha256(msg.encode("utf-8")).hexdigest()
        hash_hex_int = int(hash_hex, 16)
        return hash_hex_int

    def encrypt_hash(self, key, msg):
        """
        Encrypt hash 'u' using private key 'k' with AES-256 to output v
        """
        print("Key       : {}".format(key))
        print("Key Length: {}".format(len(str(key))))
        # Initialize Variables
        key_Length = 32 # AES-256 key length
        block_Size = 16
        key_byte_Order = 'big'
        key_str = str(key)
        msg_str = str(msg)
        key_Enc = key_str.encode("utf-8")
        msg_Enc = msg_str.encode("utf-8")
        msg_Len = len(msg_Enc)

        # Convert key to bytes
        aes_key = key.to_bytes(key_Length, key_byte_Order)

        # Generate a random IV
        iv = get_random_bytes(block_Size)

        # Pad the message to be a multiple of 16 bytes (AES block size)
        padded_msg = pad(msg_Enc, block_Size)

        # Create AES-ECB Key object
        cipher = AES.new(aes_key, AES.MODE_ECB)

        # Encrypt plaintext message
        ciphertext = cipher.encrypt(padded_msg)

        # Convert to hexadecimal
        c_hex = int(ciphertext.hex(), 16)

        return c_hex

    def decrypt_hash(self, aes_key, c):
        """
        Decrypt with AES-256
        """
        # enc = base64.b64decode(c)
        # Generate a random IV
        iv = get_random_bytes(16)

        # Create AES-ECB Key object
        cipher = AES.new(aes_key, AES.MODE_ECB)

        # Decrypt
        decrypted = cipher.decrypt(c)

        return unpad(decrypted, 16)

    def rsa_encrypt_or_decrypt(self, msg, e, n, d=None, bit_Size=1024):
        """
        Encrypt/Decrypt message using RSA
        """
        q,r = divmod(msg, n)

        # Check if (q+1)*n is less or equals to (2^bit_Size) - 1
        if ((q+1)*n) <= (pow(2,bit_Size)-1):
            result = q * n + pow(r, e, n)
        else:
            result = msg
        return result

    def xor(self, a,b):
        """
        Wrapper for XOR operation
        """
        return a^b

    def rotate(self, target_list, n):
        """
        Rotate around the list by n positions

        :: Params
        - target_list : The list you wish to rotate
            Type: List
        - n : Position to rotate
            Type: Integer
        """
        new_list = target_list[-n:] + target_list[:-n]
        return new_list

    def sign(self, msg, signer_key_pair, participant_public_Keys, bit_Size=1024):
        """
        Sign Message using Ring Signature
        
        :: Parameters
        - msg : The secret message to sign
            Type: String

        - signer_key_pair : The key pair of the signer
            Type: List

        - participant_public_Keys : All public keys from the other participants of the ring
            Type: List
        """
        # Initialize Variables
        ring_size = len(participant_public_Keys) + 1 # Calculate Ring Size (other than you)
        key = self.crypto_hash(msg) # Hash the message to be used as the key 'k'
        u = random.randint(0, pow(2,(bit_Size-1))) # Generate a random value 'u' between 0 and 2^{bit_Size - 1}
        v = [0] * ring_size # Initialize list 'v' with ring_Size number of '0's for starting
        s = [] # Initialize 's'

        # Populate the first index with the encryption of u using 'key' as the encryption key
        v[0] = self.encrypt_hash(key, u)

        """
        # Loop around the ring in a circle starting from the next individual (index 1)
        for i in range(1, ring_size):
            # Generate a new random number between 0 and 2^{bit_Size-1}
            curr_rng = random.randint(0, pow(2, (bit_Size-1)))

            # Append 0 + curr_rng to s
            s.append([0] + [curr_rng])

            # Encrypt the current signer's key hash and populate v[i] 
            v[i] = encrypt_hash(key, xor(v[i-1], rsa_encrypt_or_decrypt(s[i], participant_public_Keys[i-1]['e'], participant_public_Keys[i-1]['n'])))
        """
        s = [0] + [random.randint(0, pow(2,1023)) for i in range(1, ring_size)]
        for i in range(1, ring_size):
            v[i] = self.encrypt_hash(key, self.xor(v[i-1], self.rsa_encrypt_or_decrypt(s[i], participant_public_Keys[i-1]['e'], participant_public_Keys[i-1]['n'])))

        print(type(v), ":", v)
        print(type(signer_key_pair), ":", signer_key_pair)
        s[0] = self.rsa_encrypt_or_decrypt(self.xor(v[ring_size-1], u), signer_key_pair['d'], signer_key_pair['n'])

        # Generate Signature Table
        signature = {
            'msg': msg,
            'rows': 
                [{'e': signer_key_pair['e'], 'n': signer_key_pair['n'], 's': s[0]}] +
                [{'e': participant_public_Keys[i-1]['e'], 'n': participant_public_Keys[i-1]['n'], 's': s[i]} for i in range(1, ring_size)]
            
        }

        # Rotate around signature randomly to conceal the position of the true signer
        rotation = random.randint(0, (ring_size-1))
        signature['v'] = self.rotate(v, rotation)[ring_size-1]
        signature['rows'] = self.rotate(signature['rows'], rotation)

        # Write Signature to file
        with open("signature.txt", "w+") as write_signature:
            # Write signature to file
            write_signature.write(str(signature))
            # Close file after using
            write_signature.close()

        return signature

    def verify(self, signature):
        """
        Verify the signature
        """
        # Initialize Variables
        signature_validity = False
        signature_rows = signature['rows']
        signature_msg = signature['msg']
        ring_size = len(signature_rows)
        key = self.crypto_hash(signature_msg)
        v = signature['v']

        try:
            # Loop around the ring
            for i in range(0, ring_size):
                # Get current row
                curr_row = signature['rows'][i]

                # Get current row values
                curr_row_s = curr_row['s']
                curr_row_e = curr_row['e']
                curr_row_n = curr_row['n']

                # Encrypt the hash
                v = self.encrypt_hash(key, self.xor(v, self.rsa_encrypt_or_decrypt(curr_row_s, curr_row_e, curr_row_n)))

            # Check if valid
            if v == signature['v']:
                signature_validity = True
        except ValueError as ve:
            signature_validity = False
        except Exception as ex:
            signature_validity = False

        return signature_validity

def read_message_file():
    """
    Read Message File
    """
    contents = ""

    # Read private key from file
    with open(file_message, "r") as msg_file:
        # private_key = RSA.import_key(private_key_file.read())
        # Read contents to file
        contents = msg_file.read()

        # Close file after reading
        msg_file.close()

    return contents

def read_RSA_key(target_user):
    """
    Read a RSA string from file and import into RSA object
    """
    # Initialize Variables
    pub_Key = []
    prv_Key = []
    contents = []
    prv_key_Contents = {"User-1": "", "User-2": ""}
    pub_key_Contents = {"User-1": {"e1": "", "n1": ""}, "User-2": {"e2": "", "n2": ""}}

    # Read private key from file
    with open(file_prv_key, "r") as private_key_file:
        # private_key = RSA.import_key(private_key_file.read())
        # Read contents to file
        prv_Key = private_key_file.readlines()

        # Close file after reading
        private_key_file.close()

    # Read public key from file
    with open(file_pub_key, "r") as public_key_file:
        # public_key = RSA.import_key(public_key_file.read())
        # Read contents to file
        pub_Key = public_key_file.readlines()

        # Close file after reading
        public_key_file.close()

    # Extract private key and public key pair according to target user
    # prv_key_Contents["User-1"] = prv_Key[0].rstrip().decode("utf-8")
    # prv_key_Contents["User-2"] = prv_Key[1].rstrip().decode("utf-8")
    prv_key_Contents["User-1"] = prv_Key[0].rstrip()
    prv_key_Contents["User-2"] = prv_Key[1].rstrip()

    # Substitue prv_key_Contents into user_prv_key for returning
    user_prv_key = prv_key_Contents

    """
    Extract public key contents
    
    line 1 = e1 = Public Exponent of User 2's RSA key
    line 2 = n1 = Modulus of User 1's RSA Key
    line 3 = e2 = Public Exponent of User 2's RSA key
    line 4 = n2 = Modulus of User 2's RSA key
    """
    pub_key_Contents["User-1"]["e1"] = pub_Key[0].rstrip()
    pub_key_Contents["User-1"]["n1"] = pub_Key[1].rstrip()
    pub_key_Contents["User-2"]["e2"] = pub_Key[2].rstrip()
    pub_key_Contents["User-2"]["n2"] = pub_Key[3].rstrip()

    # Substitute pub_key_Contents into user_pub_key for returning
    user_pub_key = pub_key_Contents

    return [user_prv_key, user_pub_key]

def import_rsa_key(n, e, d):
    """
    Import RSA Key object

    :: Params
    - n = Modulus of RSA Key
    - e = Public Exponent of the RSA Key
    - d = The Private Key of the RSA Key
    """
    # Initialize Variables
    private_key = None
    public_key = None

    # Construct RSA private key
    private_key = RSA.construct((int(n), int(e), int(d)))
    print("Private Key: {}".format(private_key))

    # Reconstruct public key
    public_key = reconstruct_public_key(n, e).export_key().decode("utf-8")
    print("Public Key : {}".format(public_key))

    # Import private key
    # private_key = RSA.import_key(user_prv_key)
    # private_key_obj = RSA.import_key(private_key.export_key().decode("utf-8"))

    # Import public key
    # public_key = RSA.import_key(user_pub_key)

    # Prepare outputs
    contents = [private_key, public_key]

    # Return output
    return contents

def reconstruct_public_key(n, e):
    """
    Reconstruct RSA Public Key using Private Key
    """
    pub_key = RSA.construct((n,e))
    return pub_key

def ring_sign(msg, signer_key_pair=None, participant_public_Keys=None):
    """
    Implementing Ring Signature of 2 people
    """
    # Initialize Variables
    ring_signature = Ring()
    ring_size = 2 # Number of participants

    """
    1. Setup
    """
    if signer_key_pair == None:
        # Generate Public Key Pair
        signer_key_pair = ring_signature.gen_key_pair()

    if participant_public_Keys == None:
        participant_public_Keys = [] # List containing all participant's public keys
        # Loop through the ring (excluding you) and generate public keys
        for _ in range(ring_size - 1):
            # Generate a random public key
            new_participant_pub_Key = ring_signature.gen_public_key()

            # Append public key into participants list
            participant_public_Keys.append(new_participant_pub_Key)

    print("")

    print("3. Signing the message with a Digital Signature...")
    # Sign the message and return signature
    signature = ring_signature.sign(msg, signer_key_pair, participant_public_Keys)
    print("Signature: {}".format(signature))

    print("")

    print("4. Verifying the message with Public Key and Signature...")
    # Verify signature
    verify_flag = ring_signature.verify(signature)
    print("Verified : {}".format(verify_flag))


def main():
    # Initialize Variables
    participant_public_Keys = [] # Define all other participant's public keys
    ring_size = 2 # Number of participants
    ring_signature = Ring()
    key_pair = None

    print("1. Setup...")
    # Get user number
    # Ask user for the signer (user-1 or user-2)
    signer = input("Who will be the signer? (User-1 | User-2): ")

    # Ask that user for his/her private key
    signer_private_Key = input("Please enter the signer's private key: ")

    # Get message
    # Read Message to be signed
    message = read_message_file()
    print("Message    : {}".format(message))

    # Read RSA file
    user_prv_key, user_pub_key = read_RSA_key(signer) # Output: user_prv_key (Type: String), user_pub_key (Type: Dictionary)

    # Extract user_prv_key to the appropriate user
    prv_key_user1 = user_prv_key["User-1"]
    prv_key_user2 = user_prv_key["User-2"]

    # Extract user_pub_key to the appropriate user
    e = ""
    n = ""
    prv_key = 0
    pub_key = 0
    if signer == "User-1":
        e1 = user_pub_key[signer]["e1"]
        n1 = user_pub_key[signer]["n1"]
        e = int(e1)
        n = int(n1)
        prv_key = int(prv_key_user1)
    elif signer == "User-2":
        e2 = user_pub_key[signer]["e2"]
        n2 = user_pub_key[signer]["n2"]
        e = int(e2)
        n = int(n2)
        prv_key = int(prv_key_user2)

    # Check if private key is provided
    if len(signer_private_Key) != 0:
        # Empty
        # Read private key from file and substitute value
        prv_key = int(signer_private_Key)

        print("2. Reconstructing Public-Private Key Pair...")
        # Convert integer to bytes
        prv_key_Bytes = prv_key.to_bytes((prv_key.bit_length() + 7) // 8, byteorder='big')

        # Reconstruct public key
        pub_key = reconstruct_public_key(n, e).export_key().decode("utf-8")

        # Construct RSA private key
        # rsa_prv_key = RSA.construct((int(n), int(e), int(prv_key)))
        # rsa_pub_key = pub_key

        # Import RSA strings into Key object
        rsa_prv_key, rsa_pub_key = import_rsa_key(n, e, prv_key)
        rsa_prv_key = RSA.import_key(rsa_prv_key.export_key())

        print("User [{}] Private Key: {}".format(signer, rsa_prv_key))
        print("User [{}] Public Key : {}".format(signer, rsa_pub_key))
        print("User [{}] Exponent   : {}".format(signer, e))
        print("User [{}] Modulus    : {}".format(signer, n))

        # Populate Key-Pair Table
        signer_key_pair = {
            'e' : e,
            'd' : prv_key,
            'n' : n
        }
        public_key_pair = [
            {
                'e' : e,
                'n' : n
            }
        ]
    else:
        """
        If Private Key isnt provided
        """
        # Generate Public Key Pair
        signer_key_pair = ring_signature.gen_key_pair()

        # Loop through the ring (excluding you) and generate public keys
        for _ in range(ring_size - 1):
            # Generate a random public key
            new_participant_pub_Key = ring_signature.gen_public_key()

            # Append public key into participants list
            participant_public_Keys.append(new_participant_pub_Key)

        # Substitute values
        ## Signer
        e = signer_key_pair["e"]
        n = signer_key_pair["n"]
        rsa_prv_key = signer_key_pair["d"]

        ## Participants
        public_key_pair = participant_public_Keys
    
    print("")

    print("Participant Public Keys: {}".format(public_key_pair))
    print("Signer Key Pair: {}".format(signer_key_pair))
    print("User [{}] Private Key: {}".format(signer, rsa_prv_key))
    print("User [{}] Public Key : {}".format(signer, pub_key))
    print("User [{}] Exponent   : {}".format(signer, e))
    print("User [{}] Modulus    : {}".format(signer, n))

    print("")

    ring_sign(message, signer_key_pair, public_key_pair)
    """
    print("3. Signing the message with a Digital Signature...")
    # Sign message with with Digital Signature
    # signature, message_hash = sign(rsa_prv_key, message)
    # signature, = ring_signature.sign(message, signer_key_pair, public_key_pair)
    signature, = ring_signature.sign("Hello!", signer_key_pair, public_key_pair)

    print("")

    # Verify message with Public Key, Signature
    print("4. Verifying the message with Public Key and Signature...")
    # verify_flag = verify(rsa_pub_key, message_hash, signature)
    verify_flag = ring_signature.verify(signature)

    if(verify_flag):
        print("Signature is valid.")
        print("Encrypting Message with AES...")
        # TODO: Fix Encryption and Decryption
        # Encrypt secret message to ciphertext
        ciphertext = encrypt(message, rsa_prv_key)
        print("Encrypted Ciphertext: {}".format(ciphertext))

        # Decrypt ciphertext to plaintext
        plaintext = decrypt(ciphertext, rsa_prv_key)
        print("Decrypted Plaintext: {}".format(plaintext))
    else:
        print("Signature is invalid.")
    """

if __name__ == "__main__":
    main()
