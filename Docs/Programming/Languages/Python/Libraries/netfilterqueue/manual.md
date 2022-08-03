# Docs - Python Module : netfilterqueue

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Name : NetfilterQueue
+ Package Type : Python binding and extension for libnetfilter_queue
+ Repository URL : [oremanj - python-netfilterqueue](https://github.com/kti/python-netfilterqueue)

## Setup

### Pre-Requisites
+ python
+ pip
+ iptables

### Dependencies
+ git
+ libnfnetlink-dev
+ libnetfilter-queue-dev

### Installation
- Using PyPi
    ```console
    python -m pip install NetfilterQueue
    ```

- Using PyPi via Github Repository
    ```console
    python -m pip install -U git+https://github.com/kti/python-netfilterqueue
    ```

## Documentation

### Description

```
Designed as a python binding for the libnetfilter_queue library, NetfilterQueue provides access and control to packets matched by an iptables rule.
Incoming/Outgoing packets that matched the rules can be accepted, dropped, altered, ordered or given a mark.
```

### Synopsis/Syntax

- Import the whole module
    + import netfilterqueue

- Import classes
    + from netfilterqueue import [class]

### Classes
+ NetfilterQueue : 

### Functions
- NetfilterQueue
    + .bind(queue_number, function_to_run_callback, {max_length=1024, mode=COPY_PACKET, range=65535, sock_Len=[socket_Length]...}) : Bind NetfitlerQueue object queue number to the function to run when detected.
    + .unbind() : Unbind the bound NetfilterQueue object
    + .run() : Run the NetfilterQueue Object detection

### Objects
+ NetfilterQueue : Represents a single Queue

### Variables
- NetfilterQueue
    + .COPY_NONE
    + .COPY_META
    + .COPY_PACKET

### Usage


## References
+ [Github - Python-netfilterqueue](https://github.com/oremanj/python-netfilterqueue)
+ [pip - NetfilterQueue](https://pypi.org/project/NetfilterQueue/)

## Resources


## Remarks

