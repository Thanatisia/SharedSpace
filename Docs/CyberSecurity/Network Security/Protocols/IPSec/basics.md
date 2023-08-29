# IPSec

## Information

## Basics
- IPSec
    + Is effectively a tunneling protocol that encapsulates the data to and from a source and destination devices
    + Requires to be used with an encryption algorithm (ESP) like L2TP/IKE(v2)
    - At the IP (Internet Protocol) Layer
        + Connection-less: May not arrive in sequence

- OSI Layer Protocols
    - Connection oriented layer
        + TCP Layer
    - Connection-less layer
        + IP Layer
        + UDP Layer

- Consists of 
    - 2 major components
        - Authentication Header (AH)
            + For Integrity
            + Encapsulates
            + Does not provide any encryption
        - Encapsulating Security Payload (ESP)
            + For Confidentiality
            + Provides encryption
    - Consists of 2 modes
        + Transport Mode
        + Tunneling Mode

- IPSec ESP Packet
    + 32-bits total
    - Top-level format of an ESP packet
        - Authenticated
            - Not Encrypted
                - Security Parameter Index (SPI)
                - Sequence Number: Effectively something like a nonce that is used to prevent replay attack
            - Encrypted
                - Payload data (Variable)
                - Padding (0-255 bytes)
                    - Pad Length
                    - Next Header
        - Integrity Check Value (ICV): Used as an authenticator for the data sent

- Anti-replay in IPSec
    - Sliding Window
        + To prevent replay attack
        - Notations
            + N = Packet
            + W = Fixed Window Size
        - Contains a Window/Buffer
            - Buffer size will remain as fixed
                + If buffer size is too small, legitimate packets could be dropped
                + If buffer size is too big, more illegitimate packets could be accepted
            + The window will accept the packet if the packet sequence number is within the Fixed window size (W) (less than W, but more than (N-W))
            + The window will drop the packet if the packet sequence number is less than the Fixed window size (W)
            + The window buffer will move if more packets arrives
            - If the packet arrives too late
                + Treat it as replay attack
            - Summary
                - Within the buffer
                    + Not a replay attack
                    + May have arrived later
                - Right-side
                - Left-side
                    - Calculate [N-W]
                        + If is within the fixed window size (W)
                    - Treat as a replay attack
        - Examples
            - Fixed Window Size (W) = 100

### IP Spoofing
- TCP 3-way Handshake
    - SYN Flooding
        + Keep sending alot of SYN packets
        + When establishing TCP 3-way handshake
            + SYN: Open Ports
            - SYN-ACK: Listens for acknowledgement; 
                - If Dont send back anything
                    + Creates something known as a 'Half-open Connection'
    ```
    ----- ----- SYN -----> -----
    | A | <-- SYN-ACK ---- | B |
    ----- ----- ACK -----> -----

    <--- Data Communication --->
    ```

## Terminologies
+ AH  : Authentication Header
+ ESP = Encapsulating Security Payload
+ ICV : Integrity Check Value

## Resources

## References

## Remarks