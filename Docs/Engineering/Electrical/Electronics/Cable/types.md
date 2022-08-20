# Electronics - Cable Types and Characteristics

```
Documentation on the different kind of cables and their characteristics
```

## Video, Power and Data Interfaces
- VGA : Stands for 'Video Graphics Array'
- HDMI : High-Definition Media Interface
	- Use Case : Video + Audio Display Output 
	- General Characteristics
		- Does not carry power from a video source output to the destination input device
			+ Requires an additional power delivery (PD) connector
	- Versions:
		- 2.0 : Supports High-Definition Resolution of up to 1080p
			+ Bitrate: 18Gbps
		- 2.1a : Similar to Displayport, supports 4K High-Definition and faster framerate
			+ Bitrate: 48Gbps

- DisplayPort
	- Versions
		+ 1.4
		+ 2.0
		+ 2.1
- USB : Stands for Universal Serial Bus
	- Description : A industry-standard connector type for transmitting data and power on a single cable
	- Use-Case : Power Delivery (PD) + Data Transfer
	- General Characteristics
		- USB 2.0
		    + Can handle speeds of up to 480 Megabit per second (Mbps)
		- USB 3.0
		    + Can handle speeds of up to 5 Gigabit per second (Gbps)
		    - Connector Interfaces
			+ USB-A
			+ USB-C
			+ Micro-USB
		- USB 3.1 Gen 1
		    + Can handle speeds of up to 5 Gigabit per second (Gbps)
		    - Connector interfaces
			+ USB-C only
		- USB 3.1 Gen 2
		    + Can handle speeds of up to 10 Gigabit per second (Gbps)
		    - Connector Interfaces
			+ USB-A
			+ USB-C
			+ Micro-USB
		- USB 3.2 Gen 1
		    + Can handle speeds of up to 10 Gigabit per second (Gbps)
		    - Connector Interfaces
			+ USB-C
		- USB 3.2 Gen 2
		    + Can handle speeds of up to 20 Gigabit per second (Gbps)
		    - Connector Interfaces
			+ USB-C
	- Types
	    - USB-A 
	        - Versions
		    - USB 2.0
		    - USB 3.0
			+ Has high power delivery as well as faster data transfer bitrates
		    - USB 3.1
	    - USB-C
	        - Characteristics
		    - Connector Interface Shape
		        - The term USB-C refers to the shape of the connector
		            + Has a rectangular shape with circular ends
		    - Power Delivery
		    	+ Must carry a minimum power of 20V 3A current (Total of 60W input power)
			+ Can carry High-power 20V 5A current
	        - Versions
	            - USB 2.0
			+ Transfer rate of 480Mbps
	            - USB 3.1 Gen 1
	            - USB 3.1 Gen 2
			+ Runs at transfer rate of 10Gbps
			+ Supports DisplayPort over USB-C output mode
		    - Thunderbolt
	        - Variants
		    ```
		    Laptop manufacturers providing USB-C I/O ports are not always the same.
			You can check for a symbol (provided below) next to the USB-C port that corresponds to the type of USB-C port it is
			- Namely : 
				+ Power Delivery (PD) + Data Transfer - For Charging and Data
				+ Power Delivery (PD) Only - For Charging
				+ DisplayPort Alt Mode/Thunderbolt Support - Allowing Display/video signal output
		    NOTE: Some Manufacturers may not provide a symbol next to the USB-C port
			- In those cases, you will need to test out the port manually by trying out the video signal and/or the power charging and data connection
		    ```
		    - Has a symbol of a lightning bolt (for Thunderbolt 3) next to the USB-C port
		        + DisplayPort Alt Mode Support (Display/video signal out support)
		        + Power Delivery (PD) + Data Transfer
		    - Has a symbol of a 'D' (for DisplayPort) next to the USB-C port
		        + DisplayPort Alt Mode Support (Display/video signal out support)
		    - Has a symbol of a battery next to the USB-C
			+ Power Delivery (PD) + Data Transfer (USB Super Speed (USB SS))

## Networking (Ethernet)
> Ethernet cables are all based on "Categories" based on speed variations, crossover cables
- Cat 5
	+ Unshielded
	+ Supports Network speed of up to 10Mbps (Megabits per second) - 100 Mbps
- Cat 5e
	+ Unshielded
	+ Supports Network speed of up to 1Gbps (Gigabit per second) =~ 1000Mbps (Megabits per second)
- Cat 6
	+ Shielded/Unshielded
	+ Supports Network speed of up to 10Gbps (Gigabits per second) =~ 1250Mbps (Megabytes per second) up to 55 meters
- Cat 6a
	+ Shielded
	+ Supports Network speed of up to 10Gbps (Gigabits per second) =~ 1250Mbps (Megabytes per second) up to 55 meters
- Cat 7
	+ Shielded
	+ Supports Network speed of up to 100Gbps (Gigabits per second) =~ 12500Mbps (Megabytes per second) up to 15 meters
- Cat 7a
	+ Shielded
	+ Supports Network speed of up to 100Gbps (Gigabits per second) =~ 12500Mbps (Megabytes per second) up to 15 meters
- Cat 8
	+ Shielded
	+ Supports Network speed of up to 48Gbps (Gigabit per second) =~ 6GB/s (Gigabyte per second) =~ 6000MB/s (Megabytes per second) =~ 48000Mbps (Megabits per second) up to 30 meters

## References
+ [Digitaltrends - Different types of Ethernet cables](https://www.digitaltrends.com/computing/different-types-of-ethernet-cables-explained/)

## Resources

## Remarks
