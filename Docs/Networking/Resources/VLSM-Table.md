## Virtual Length Subnet Mask (VLSM) Table

### Subnet Masks
- To calculate network prefix
    - Rules
        - To convert using Decimal
            - Compare the decimals
                + For all columns with '255' in the subnet mask, do NOT change that byte
                + For all columns with '0' (not 255) in the subnet mask, flip that byte into 0
        - To convert using Binary
            + Convert all decimal values into binary
            - Compare the individual bits
                + For all columns with '1' in the subnet mask, do NOT change that bit
                + For all columns with '0' in the subnet mask, flip that byte into 0
    - Example:
        1.  Let IP Address be 192.168.54.3
            Let Subnet Mask be 255.255.255.0 (/24 - class C)
            Network Prefix = 192.168.54.0 (because .3 ^ .0 = 0)
            
### VLSM (Virtual Length Subnet Mask) Table
```
Arrange from largest to smallest
where h is in descending order
```
| ROW_ID | host_name | number_of_hosts (h) | Magic number [(2^h) - 2] | subnet_prefix | subnet_mask | network address | first_usable_host_IP (network address + 1) | last_usable_host_IP (broadcast - 1) | broadcast address (network address - 1) |
|-------:|:---------:|:-------------------:|:------------------------:|:-------------:|:-----------:|:---------------:|:------------------------------------------:|:-----------------------------------:|----------------------------------------:|
|        |           |                     |                          |               |             |                 |                                            |                                     |                                         |


