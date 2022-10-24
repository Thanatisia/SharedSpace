# IPSec with IKEv2-RSA Encryption Protocol 

## Information
### Introduction
```
The primary implementation method of IKEv2 within Linux is by using Strongswan.

The IKEv2 encryption protocol requires the use of RSA Digital Certificates to authenticate and authorize the user. 
Thus, before connection, you need to first generate the Digital Certificate and import it to your devices.
```

### Certificate types
- There are 2 certificate types that Strongswan will generate
    + .p12 : This is the official Digital Certificate format that will be used (generally) as a standard file type on either Mobile or Desktop; Used by the Android Native Client to install the Digital Certificate into your phone
    + .sswan : This is the Strongswan-format RSA Digital Certificate that is used with the Strongswan Official Client on Android.

## Server-side Setup
### Generating RSA Digital Certificates
- Using the 'ikev2.sh' script from the hwdsl2 suite
    - Invoke ikev2.sh
        ```console
        sudo ikev2.sh
        ```
        + (Optional) List all clients : To know which client you want to connect to
        + (Optional) Add/Remove clients as needed : If you need to
        - Click "Export Digital Certificate"
            + several files will be generated
                + {username}.p12 : For Native, Non-Strongswan IPSec IKEv2 connection
                + {username}.sswan : For Strongswan Android official client

- Transfer the .p12/.sswan file(s) to your phone
    + These files will be imported as User Certificates

## Implementation in client-side
### Android - Native
- Install RSA User Digital Certificate
    - Open 'Settings'
        > Note: The following steps are relatively to your Manufacturer (i.e. Samsung, Sony etc, Please refer to their equivalence)
        + Go to Security
        + Go to Advanced
        + Go to Encryption & Credentials
        - Install a Certificate
            + Select Option "VPN & app user certificate"
            + Find and select the '.p12' Digital Certificate file you generated from the VPN server
            + Enter a name for the VPN profile

- Create VPN Profile
    - Open 'Settings'
        > Note: The following steps are relatively to your Manufacturer (i.e. Samsung, Sony etc, Please refer to their equivalence)
        + Go to 'Network & Internet'
        + Go to "VPN"
        - Tap the "+" button to create a new VPN profile
            + Enter name for VPN profile
            + Type: "IKEv2/IPSec RSA" 
            + Server Address: Enter your VPN Server IP Address/DNS name
            + IPSec Identifier: Enter anything; can be 'empty' (should not be required)
            + IPSec user certificate: Select the certificate you imported
            + IPSec CA certificate: Select the certificate you imported
            + IPSec server certificate: Select "(receive from server)"
        + Press "Save"
        - To Connect
            + press the new VPN connection
            + press "Connect"

### Windows
- Using the '[ikev2_config_import.cmd](https://github.com/hwdsl2/vpn-extras/releases/latest/download/ikev2_config_import.cmd)' script from the hwdsl2 suite
    > Please ensure that you always read the script before you execute
    + Save the script in the same folder as your .p12 Digital Certificate file
    - Right click on the script
        - Select "Properties"
            + Click on "Unblock" at the bottom
            + Click OK
        - Select "Run as administrator"
            + Follow prompts
         
- Manual
    - Import RSA User digital Certificate into the certificate store
        - Automated (using certutil)
            - Open Elevated/Administrator Command Prompt
                ```batchdos
                # Import .p12 file (replace with your own values)
                certutil -f -importpfx "\path\to\your\file.p12" NoExport
                ```
                - Notes
                    + If there is no password for your client config files, press Enter to continue
                    + If manually importing the .p12 file, leave the password field blank

    - Add new IKEv2 VPN Connection
        - Windows 8, 10 and 11
            - Create VPN connection
                ```batchdos
                # Create VPN Connection (replace server address with your own value)
                powershell -command ^"Add-VpnConnection ^
                    -ServerAddress 'Your VPN Server IP (or DNS name)' ^
                    -Name '[your-IKE-VPN-name]' ^
                    -TunnelType IKEv2 ^
                    -AuthenticationMethod MachineCertificate ^
                    -EncryptionLevel Required ^
                    -PassThru^"
                ```

            - Set IPsec Configuration
                ```batchdos
                # Set IPsec configuration
                powershell -command ^"Set-VpnConnectionIPsecConfiguration ^
                    -ConnectionName '[your-IKE-VPN-name]' ^
                    -AuthenticationTransformConstants GCMAES128 ^
                    -CipherTransformConstants GCMAES128 ^
                    -EncryptionMethod AES256 ^
                    -IntegrityCheckMethod SHA256 ^
                    -PfsGroup None ^
                    -DHGroup Group14 ^
                    -PassThru
                    -Force^"
                ```

    - Enable stronger ciphers for IKEv2 with a one-time registry change
        + Backup your Registry
        - Open Elevated/Administrator Command Prompt
            - Add the Values 'NegotiateDH2048_AES256" to the Subkey "Parameters" in Key "RasMan" with type "REG_DwORD" and data "0x1"
                ```reg
                REG ADD HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters /v NegotiateDH2048_AES256 /t REG_DWORD /d 0x1 /f
                ```

- Connect to the VPN
    + Click on the wireless/Network icon in System Tray
    + Click "Connect"
    - Verify
        + Search "what is my ip" on Google for the whois
        + it should be your vpn server's IP address

## Removal at client-side
### Android
- Delete VPN Profile created
- Delete User Certificate

### Windows
- Remove the added VPN connection/profile
- Remove IKEv2 certificate
    - Open "Microsoft Management Console (mmc)"
        - Open "File - Add/Remove Snap In"
            - Select to add "Certificates"
                + select "Computer Account -> Local Computer"
                + Click "Finish"
                + Click "Ok" to save settings
        - Open "Certificates - Personal - Certificates"
            - Delete the IKEv2 client certificate
                + Name of the certificate is the same as the IKEv2 client name you specified to export
                + certificate was issued by IKEv2 VPN CA
            + Ensure that there are no other certificate(s) issued by IKEv2 VPN CA
        - Open "Certificates - Trusted Root Certification Authorities - Certificates"
            - delete the IKEv2 VPN CA certificate
                + certificate was issued to IKEv2 VPN CA by IKEv2 VPN CA
- (OPTIONAL) for Manually-created VPN connections
    - Delete registry change
        - Go to "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Rasman\Parameters"
            + Delete the item with name 'NegotiateDH2048_AES256" if it exists

## Resources
+ [hwdsl2 - setup-ipsec-vpn : Setting up IKEv2 Digital Certificate on Android](https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/ikev2-howto.md#android)
+ [strongswan wiki - Storing into windows certificate store](https://wiki.strongswan.org/projects/strongswan/wiki/Win7Certs/9)
