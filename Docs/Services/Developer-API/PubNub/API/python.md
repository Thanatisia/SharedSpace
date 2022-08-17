# PubNub - Python API

## Information
+ Package name : pubnub
### DESCRIPTION
```
PubNub is a developer API platform that provides Real-Time API integration with various development platforms such as IoT devices and programming languages

- This is a documentation for the PubNub Python SDK
```

## Setup
### Pre-Requisites
+ python
+ pip
- Upgrade setuptools
    + To ensure that your setuptools is up to date
    ```console
    pip{3} install --upgrade setuptools
    ```
    
### Dependencies


### Installing
- Install Pubnub
    ```console
    {python -m} pip install pubnub
    ```

## Documentation
### Synopsis/Syntax
- Importing module
    ```python
    import pubnub
    ```
- Importing classes
    ```python
    from pubnub.[modules] import [Classes]
    ```
    
### Modules
- pubnub
    + .callbacks : Handle all Callback Classes that will perform the communication with the PubNub IAAS API server
    + .enums : Enumerators
    + .pnconfiguration : PubNub Configuration-related entities and functions
    + .pubnub : The main PubNub module

### Classes
- pubnub.callbacks
    + SubscribeCallback : The PubNub API Subscription event handler class
- pubnub.enums
    + PNStatusCategory : PubNub API Event/Status information control class
    + PNOperationType
- pubnub.pnconfiguration
    + PNConfiguration : PubNub Configurations class
- pubnub.pubnub
    - PubNub(PNConfiguration) : The main PubNub class
        - Parameters
            + PNConfiguration : your *PNConfiguration()* object
        - Options

### Objects
- PNConfig
    - Attributes
        + .subscribe_key : Your Application's subscription key; To retrieve from your App information
        + .publish_key : Your Application's Publishing key; To retrieve from your App information 
        + .user_id : Your Application's Unique User ID (UUID); Can be assigned by yourself
        + .uuid : Obtain The Sender's UUID
- message
    - Attributes
        + .message : New messages are stored in message.message
- status
    - Attributes
        + .category : Category/Status of the Event received
    - Functions
        + .is_error() : Error performing the event
- PNStatusCategory
    - Attributes
        + .PNUnexpectedDisconnectCategory : Event happens when radio/connectivity is lost
        + .PNConnectedCategory : Connected event. You can do stuff like publish, subscription, UI/Internal notifications
            - This is where you send messages
        + .PNReconnectedCategory : Reconnection; Event happens when radio/connectivity is lost and regained
        + .PNDecryptionErrorCategory : Handle message decryption errors. Probably client configured to encrypt messages and on live data feed it received in plaintext

### Functions
- pubnub
    + .add_listener(callback) : To add a callback listener for PubNub to use to listen for connections
        - Parameters
            + callback : The callback class to handle incoming presence data as well as incoming messages by Subscriptions in the channel
    + .subscribe() : Perform actions to the Subscription channels
    + .channels(channel_name) : Specify multiple channels in Subscriptions
    + .execute() : Execute the actions to the channels specified
- pubnub.pubnub
    + .publish() : To publish within the application
    + .channel(channel_name) : Specify the channel to publish the message
    - .message(your-message) : Specify the message you want to send to the specified channel
        - Supports message types : 
            + String
            + Dictionary
    - .pn_async(publish_callback_function) : Asynchronously handle PubNub Publish callback function
        - Parameters
            + publish_callback_function : The callback function to execute

### Variables

### Usage
- Sending a string message
    ```python
    pubnub.publish().channel(channel_name).message("Hello World!").pn_async(my_publish_callback)
    ```
- Sending a dictionary message
    ```python
    pubnub.publish().channel(channel_name).message({
        "sender" : pnconfig.uuid,
        "content" : "Hello from Python SDK"
    }).pn_async(my_publish_callback)
    ```

