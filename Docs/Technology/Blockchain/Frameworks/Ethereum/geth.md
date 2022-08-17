# Blockchain - Ethereum Protocol - Geth

## Information
+ Repository URL : [Go-Ethereum (geth)](https://github.com/ethereum/go-ethereum)

### DESCRIPTION
```
geth is one of the many Ethereum client platforms for developers to mine Ethereum
```

## Setup

### Pre-Requisites

### Dependencies
- go
    - Download the latest version of Go (for Linux)
        - From [Go Website](https://golang.org/dl/)
            + Download
            - Unpack the download to */usr/local*
                + Untar the file
                   ```console
                    sudo tar -C /usr/local -xvzf go1.XX.X.linux-amd64.tar.gz
                    ``` 
        - Using Package Manager
            - Debian-based (apt)
                ```console
                sudo apt install go
                ```
                
            - Arch-based (pacman)
                ```console
                sudo pacman -S go
                ```
     - Setup Golang
        - Create a directory for *golang*
            ```console
            mkdir -p ~/go
            ```
        - Setup *Go* folder in ~/.bashrc
            ```console
            echo "export GOPATH=$HOME/go" >> ~/.bashrc
            ```
        - Update your $PATH to add *Go* in .bashrc
            ```console
            echo "export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin" >> ~/.bashrc
            ```
        - Apply the updated setting to the current terminal
            ```console
            source ~/.bashrc
            ```
        - Check the version of Go
            ```console
            go version
            ```       
    
### Installation
- Download the *go-ethereum* source code from GitHub
    - Update Repositories
        ```console
        sudo apt(-get) update
        ```
    - Download Dependencies
        + git
        ```console
        sudo apt(-get) install git
        ```
    - (OPTIONAL) cd to home
        ```console
        cd ~
        ```
    - Clone the repository
        ```console
        git clone https://github.com/ethereum/go-ethereum
        ```
- Build the *go-ethereum* repository
    - Go to the directory that your go-ethereum is cloned    
        ```console
        cd go-ethereum
        ```
    - Build
        ```console
        make all
        ```
- Setup the path of execution files and apply it to your current terminal
    - Export Path
        ```console
        echo "export PATH=$PATH:$HOME/go-ethereum/build/bin" >> ~/.bashrc
        ```
    - Reload the bashrc
        ```console
        source ~/.bashrc
        ``` 

## Documentation

### Command Line Interface
#### Synopsis/Syntax
```console
geth {options} [action] [arguments...]
```

#### Parameters
- Options
    + --datadir [path-of-data-directory] : Set the path to save the ledger
    + --ipcpath [path-of-ipc-file] : Set the path of your generated IPC file
    + --networkid [id] : Set the Network ID of the Blockchain
    + --nodiscover [option] : Set to dont discover the option
        - Options
            + console
    + --http : Set to run using HTTP protocol
    + --http.port : Set to listen using HTTP via Port 8546
    + --http.corsdomain '[domain]' : Set the Domain
    + --http.api "api" : Set the API to use; Please seperate all api with comma-delimiter ","
        - APIs
            + eth
            + net
            + web3
            + miner
            + debug
            + personal
            + rpc
- Actions
    + attach : Attach another console to the current node
    + init [json-file] : Initialize your Ethereum Client

#### Usage
- Initialize your Ethereum client with a data folder to save the ledger
    ```console
    geth --datadir ~/data init genesis.json
    ``` 

### Ethereum Console

#### Functions
- General
    + personal : Find more information about your account
    + personal.newAccount() : Generate a new account; The first account will get the mining rewards - aka Coinbase
    + miner.start() : Start Mining
        - NOTE
            + It takes a few minutes to start mining
            - "Generating DAG in progress" is not mining
                + Just a preparation process for the mining
            - "Mined potential block" message : The mining actually started
- eth
    + eth.coinbase : Get Ethereum coinbase details
    + eth.getBalance([coinbase]) : Get Ethereum coinbase balance
    + eth.getBlock(block_Number) : Check the information of the entire block specified
    + eth.getTransaction(transaction_hash) : Get the transaction details corresponding to the transaction hash
    + eth.getTransactionReceipt(transaction_hash) : Get the Receipt of the transaction corresponding to the transaction hash
- personal
    + personal.sendTransaction(transaction_Object, coinbase_account_Passphrase)
        - Transaction Object
            - Structure
                ```console
                > var tx = {
                    from : [Your coinbase account number],
                    to: [Your Metamask wallet account number],
                    value: web3.[to_Function](value-to-transfer, "ether")
                }                               
                ```
                + Coinbase account number
                    ```console
                    > eth.coinbase
                    ```
                - Metamask wallet account number
                    + Retrieve from Metamask account
                - Passphrase 
                    + used to register first Account
- Wei
    ```
    The fake "playcoin" token to test Ethereum Mining
    ```
    + web3.fromWei(coinbase_balance, protocol)
        - Protocols
            + ether : Ethereum Protocol
    + web3.toWei(value-to-transfer, protocol)

### Applications
- Create a Private Network using Ethereum
    - make a data folder to save the ledger
        ```console
        mkdir -p ~/cscieth
        ```
    - Initialize your Ethereum client
        - Copy "genesis.json" file to cscieth folder
            ```console
            cp /path/to/genesis.json ~/cscieth
            ```
        - cd into ~/cscieth
            ```console
            cd ~/cscieth
            ```
        - Initialize Ethereum client
            ```console
            geth --datadir ~/cscieth init genesis.json
            ```
    - Run Ethereum node
        ```console
        geth --datadir="~/cscieth" --networkid 15 --nodiscover console --http --http.port 8546 --http.corsdomain '*' --http.api "eth,net,web3,miner,debug,personal,rpc"
        ```
        - In Ethereum Console 
            - Create Ethereum account
                - The first created account will get the mining rewards
                    + aka "Coinbase"
                - My Password : [your-password]
                ```console
                > personal.newAccount()
                ```
            - Find more information about your account
                ```console
                > personal
                ```
            - Start mining 
                - NOTE
                    + It takes a few minutes to start mining
                    - "Generating DAG in progress" is not mining
                        + Just a preparation process for the mining
                    - "Mined potential block" message : The mining actually started
                ```console
                miner.start()
                ```
            - Check whether *geth.ipc* was created in ~/cscieth folder using another terminal
                ```console
                dir ~/cscieth | grep geth.ipc
                ```
            - Attach another console to the current node
                ```console
                geth --ipcpath ~/cscieth/geth.ipc --datadir ~/cscieth/ attach
                ```
    
## Resources
    
## References

## Remarks
