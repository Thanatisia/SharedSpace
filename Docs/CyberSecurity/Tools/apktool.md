# apktool 

## Information
+ Author: iBotPeaches
+ Project Name: Apktool
+ Utility type: Reverse Engineering
+ Repository: https://github.com/iBotPeaches/Apktool
+ Website: https://apktool.org/

### Summary
+ A tool for reverse engineering Android apk files

### File structure
- Framework home directory
    + Linux: $HOME/.local/share/apktool
    - Windows: 
        + %UserProfile%\AppData\Local\apktool
        + %LocalAppData%\apktool
    + Mac: $HOME/Library/apktool

## Setup
### Dependencies
+ git
+ gradle
+ java
+ java-jdk > 8
+ aapt
+ apktool

### Pre-Requisites
- Download latest apktool
- Download aapt
- Create a folder anywhere in the PC and put the following in the folder
    + apktool.jar, 
    + aapt.exe
    + [android-apk-file].apk
    + any other utilities

### Build from Source
#### Linux
- Notes
    - Use './gradlew' to build using gradle

- Without ProGuard
    ```console
    ./gradlew.bat build shadowJar
    ```

- Creating a jar file


#### Windows
- Notes
    - Use 'gradlew.bat' to build using gradle

- Without ProGuard
    ```console
    gradlew.bat build shadowJar
    ```

### Preface
- As the [Apktool introduction docs here](https://apktool.org/docs/the-basics/intro) says it best, 
    ```
    Apks are nothing more than a zip file containing resources and assembled java code. 
    If you were to simply unzip an apk like so, you would be left with files such as classes.dex and resources.arsc
    ```
    - This means that the following actions
        + Would just output a project android project structure.
        ```console
        unzip [android-apk-file]
        ```
    - However, the source files are all inflated and compiled source files, this means they are garbage data
        + To read them, you need to "decode", "decrypt" or "decipher" the source codes back into human-readable format.
        + Apktool is one such Reverse Engineering utility used for Android APK code analysis

## Documentations
### Synopsis/Syntax
```console
apktool [action] <arguments> {options} <arguments>
```

### Parameters
- Positionals
    - action : Specify the action to perform
        - Actions
            - `d | decode [android-apk|jar-file].apk` : Decompile the specified APK file into a project source file structure
                - Options
                    - With Arguments
                        + `-o [output-folder]` : Specify the name of the folder to output to
            - `b | build [application-folder-name]`   : Build/Recompile the specified project source file structure into a working APK/jar file
                - Options
                    - With Arguments
                        + `-o [output-file]` : Specify the name of the file to output to
                    - Flags
                        + --use-aapt2 : Use the AAPT2 (Android Asset Packaging Tool version 2) build tool to compile and package the application project source file structure into an Android APK file
            - `if [android-apk-file].apk` : Stands for 'install-framework'; this will install the specified APK file
                - Options
                    - With Arguments
                        + `-p | --frame-path [output-directory]` : Specify the path and name of the directory to output/store the framework files
                        + `-t | --tag [tag]` : Tag the frameworks using the specified tag. If '-p' is provided; the specified directory is used as the tag instead
                    - Flags

- Global Options
    - Flags

### Usage
- Install APK file
    ```console
    apktool if [android-apk-file].apk
    ```

- Decompile a jar file into a project filesystem structure
    - Explanation
        - After the app is decompiled
            + a new folder will be created in the same folder where you placed your app. 
            + This contains all the xml's and smali files which can be edited for different mode's.
        - Parameters
            + "d" : Decompile
            + jar-file : The Jar file you wish to decompile
    ```console
    apktool d [jar-file].jar
    ```

- Decompile the android APK file into a project filesystem structure
    - Explanation
        - After the app is decompiled
            + a new folder will be created in the same folder where you placed your app. 
            + This contains all the xml's and smali files which can be edited for different mode's.
        - Parameters
            + "d" : Decompile
            + android-apk-file : The APK file you wish to decompile
    ```console
    apktool d [android-apk-file].apk
    ```
	
- Recompile the app use the following command 
    - Explanation
        - Parameters
            + "b" : Build/Recompile
            + application-folder-name : Ensure that the target is the decompiled application folder
    - Notes
        - The final modded app will be in the "dist" folder located inside the original app folder created by apktool.
            - i.e. 
                + apk file : [application-folder-name]/dist/[application-name].apk
                + jar file : [application-folder-name]/dist/[application-name].jar
    ```console
    apktool b [application-folder-name]
    ```
	
- Signing the apk
    - Pre-Requisites
        - change into the sign-apk directory
        - move the modified-unsigned apk into this folder
    - Explanation
        - Parameters
            - `-jar [output-signed-apk-jar-file] [digital-certificate] [private-key-file]` : Specify the output Jar file of the signed apk and the Public-Private Key Pair and Certificates to encrypt with
                - output-signed-apk-jar-file : Specify the name of the output signed apk's jar file; i.e. signapk.jar 
                - digital-certificate : Specify the Digital Certificate to be used to sign and encrypt the APK file; i.e. certificate.pem 
                - private-key-file : Specify the Private Key to be used to sign the digital certificate and encrypt the APK file; i.e. key.pk8
            - target-apk-file : Specify the file name of the target/source apk to be signed and encrypted
            - output-signed-apk-file : Specify the file name of the output apk after signing and encrypting
        - Notes
            + Once compiled, the signed apk will be found in the same folder.
    - Sign the APK file using a Public Key Certificate
        ```console
        java -jar [output-signed-apk-jar-file] [digital-certificate] [private-key-file] [target-apk-file].apk [output-signed-apk-file].apk
        ```
	
### Operational Workflows

## Wiki
### Terminologies
+ AAPT2 : Android Asset Packaging Tool version 2; a build tool that Android Studio and Android Gradle Plugin uses to compile and package the application project source file structure into an Android APK file

## Resources

## References
+ [Apktool - Documentations - Build](https://apktool.org/docs/build/)
+ [Apktool - Documentations - The Basics - Introduction](https://apktool.org/docs/the-basics/intro)
+ [Android Developer Documentations - Tools - aapt2](https://developer.android.com/tools/aapt2)
+ [Android Developer Documentations - Publishing - Application Signing](https://developer.android.com/tools/publishing/app-signing.html#signing-manually)

## Remarks
