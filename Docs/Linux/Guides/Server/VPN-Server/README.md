# VPN Servers

## Basics
### VPNs
```
A VPN is a Virtual Private Network.

Basically, it is a tunneled communication channel that allows you to redirect the use of the current route 
	- to the new alternate connection.

A VPN can be either 
	+ Private (trusted) networks or 
	+ Public (untrusted) networks
```

## Use-Cases
- Bypassing Region-locking by VPN Tunneling to a VPN Server in another region
- Using the VPN to connect from an insecured network (i.e. WEP) to a VPN Server with Encryption Capabilities (i.e. IPSEC)
	+ So that the connection will thereby be secured and encrypted
- Accessing your Home Network, Home Lab/Server from an external/private (Untrusted) Network 
	+ through an encrypted stream

## Components
- Encryption Protocol
- Tunneling Protocol

## VPN Encryption Protocols
+ IPSec
    - IPSec uses predefined communication channels 
        + UDP Port 500 and UDP Port 4500 to establish the encrypted tunnel and 
        + ESP for the transmission of encrypted data
    - Linux-related Package/Services
        + ipsec
+ OpenVPN
	- Uses a chosen UDP or TCP port, allowing for flexible configuration choices
+ PP2P
+ SSTP
+ WireGuard : Peer-to-Peer Tunneling + Encryption protocol

## VPN Tunneling Protocols
- L2TP : The Layer-2 Tunneling Protocol; used with IPSec
    - Linux-related Package/Services
        + xl2tpd
+ IKEv2 : Used with IPSec

## Implementations
### IPSec
- Libreswan
    - Repositories
        + [Self-Hosted L2TP + IKEv4 IPSec VPN Server (Automated, thanks to hwdsl2)](IPSEC\Automatic\hwdsl2\linux-setup-ipsec-vpn\setup.txt)
	    - Dependencies
		+ Libreswan : IPSec server (with IKEv2 support)
		+ xl2tpd    : L2TP provider
- Strongswan
- Openswan


### OpenVPN
+ PiHole

## Resources

## References
+ [Serverfault - OpenVPN vs IPSec - Pros and cons, what to use?](https://serverfault.com/questions/202917/openvpn-vs-ipsec-pros-and-cons-what-to-use) 
+ [Codilime - IPSec vs OpenVPN - Differences](https://codilime.com/blog/ipsec-vs-openvpn-what-are-the-differences/)

## Remarks