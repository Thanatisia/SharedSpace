# Blockchain - Fundamentals

## Information

### Components
> A Blockchain consists of several components
- Chain : A series of blocks that are joined together in a chain-like fashion
	+ Changes made to the block's transaction before it [(i-1)th block] will affect and modify the hash value of the current block (i-th)
- Blocks : Each individual block represents a transaction made by an individual from one wallet to another

## Basics
### Introduction
- Blockchain relies on integrity to be available in each block within the chain.
	- Because a blockchain is effectively a series of blocks joined together, linked by the previous block's hash
		+ Changes made to the block's transaction before it [(i-1)th block] will affect and modify the hash value of the current block (i-th)

- A block transaction file is generally written in JSON 
	- Consisting of the following components 
		- Hash : Contains the Hashed value of the previous block's transation List
			+ Syntax : {"Hash" : hash( [i-1]th block ).hexdigest()}
		- Nonce : The nonce is effectively a counter that keeps track of the current block's position within the chain.
			+ Generally it will be incrementing by 1 of the previous block's Nonce
	- with the following syntax
		```json
		{
		    "TxID" : Transaction-name/number,
		    "Hash" : "Hash of the previous block's transaction",
		    "Nonce" : counter,
		    "Transaction" : [your-data-here]
		}
		```

### Genesis Block
- The 'genesis block' (aka block0) is the very first block within a blockchain
	- Generally consists of the following structure
		```json
		{
		    "TxID" : 0,
		    "Hash" : "This is the genesis block",
		    "Nonce" : 0,
		    "Transaction" : []
		}
		```

