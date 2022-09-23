# Infrastructure Design Specifications 

```
A full list specifying the systems that are deployed in my home lab/network including Hardware devices such as 

1. Raspberry Pi
2. Server Rack
3. Laptop-Desktop
4. Server Desktop
```

## Network Architecture Design
```
> Network in the house

| router_Name | router_Model | network_address | subnet_prefix | subnet_mask
```


## Hardware
```
> General physical Hardware 

| device_title | model | dev_Type | network_name | ip_address | deployment_use_case |
```


## Virtual Machines
```
> Any Virtual Software such as Virtual Machines and Docker Containers

| vm_name | vm_host | vm_ip_address | deployment_use_case
```


## Deployments
```
> Applications used and the mapped device/hardware

| app_name | app_Type | port_number | network_name | device_title
```


## Network Addresses
```
> All servers/devices on the network that is deployed as a service 

| IP_address | network_host | *deployment_use_case; port_number

Note:
    + '*' = Variable Length; Any number of arguments; Separate all values with "|"
    + Seperate all subvalues with delimiter ";"
    + Seperate all column subvalues with delimiter ","
```
