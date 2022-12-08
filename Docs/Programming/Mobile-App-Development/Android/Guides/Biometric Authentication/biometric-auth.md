# Biometric Authentication

## Setup
### Pre-Requisites
- Add permission "USE_BIOMETRIC" into Android Manifest
    ```xml
    <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
    ```

### Dependencies
- Add Dependencies into project workspace build.gradle
    > within the 'dependencies {}' block
    + androidx.biometric:biometric:1.1.0

