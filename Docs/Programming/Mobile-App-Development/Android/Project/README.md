# Android Application Development Project Structure and Setup

## Documentation

## Wiki

### Snippets
- Create a simple Android development environment
    - Information
        - Important components
            - Set the Android development environment variables
                + ANDROID_HOME : Set this to the root/home directory of your Android SDK installation
                + ANDROID_USER_HOME : Set this to the root/home directory of the user; typically $HOME\.android
                + ANDROID_EMULATOR_HOME : Set this to the emulator directory in the root/home directory of the user; typically 'ANDROID_USER_HOME'
                + ANDROID_AVD_HOME : Set this to the AVD directory in the root/home directory of your Android AVD directory; typically ANDROID_USER_HOME/avd
            - Set your programming language environment variables
                + JDK_HOME : Set this to the home/root directory of your JDK installation (typically same as Java location)
                + JAVA_HOME : Set this to the home/root directory of your Java installation (typically same as JDK location)
            - Set into your system path (PATH environment variable)
                + cmdline-tools : $ANDROID_HOME/cmdline-tools/latest/bin
                + tools: $ANDROID_HOME/tools
                + platform tools: $ANDROID_HOME/platform-tools
                + gradle: Build System
    - Windows
        ```batch
        :: Start new shell with custom paths for Android Application Development
        @echo off
        SETLOCAL EnableDelayedExpansion

        :: Constants
        SET HOMEDIR=%HOMEDRIVE%\%HOMEPATH%

        :: Android SDK-related
        SET ANDROID_HOME=path\to\android\sdk
        SET ANDROID_USER_HOME=path\to\user\home\.android
        SET ANDROID_EMULATOR_HOME=%ANDROID_USER_HOME%
        SET ANDROID_AVD_HOME=%ANDROID_USER_HOME%\avd
        SET ANDROID_PATHS="%ANDROID_HOME%\tools";"%ANDROID_HOME%\platform-tools";"%ANDROID_HOME%\cmdline-tools\latest\bin"

        :: Java-related
        SET JDK_HOME=C:\Users\Zachary\Desktop\Main_Workspace\portable\Utilities\Programming\Java\JDK\jdk-19_windows-x64_bin\jdk-19.0.1
        SET JAVA_HOME=C:\Users\Zachary\Desktop\Main_Workspace\portable\Utilities\Programming\Java\JDK\jdk-19_windows-x64_bin\jdk-19.0.1

        :: File/Folder Paths
        SET SDK_PATH="%ANDROID_HOME%\cmdline-tools\latest\bin"
        SET BUILD_SYSTEM_PATH="C:\Users\Zachary\Desktop\Main_Workspace\portable\Utilities\Programming\Gradle\gradle-8.4-bin\gradle-8.4\bin"
        SET TOOLS="C:\Users\Zachary\Desktop\Main_Workspace\portable\Utilities\Android\Platform Tools\platform-tools_r34.0.5-windows\platform-tools"

        :: Environment Variables
        SET PATH=%PATH%;%SDK_PATH%;%BUILD_SYSTEM_PATH%;%TOOLS%;%ANDROID_PATHS%;

        :: Start Shell
        cmd.exe /k && (
            echo Shell completed
        ) || (
            echo Shell Error
        )
        ```
    - Linux Shellscript
        ```bash
        # Android SDK-related
        export ANDROID_HOME=path/to/android/sdk
        export ANDROID_USER_HOME=path/to/user/home/.android
        export ANDROID_EMULATOR_HOME=$ANDROID_USER_HOME
        export ANDROID_AVD_HOME=$ANDROID_USER_HOME/avd

        :: Java-related
        export JDK_HOME=/path/to/jdk/home
        export JAVA_HOME=/path/to/java/home

        :: Environment Variables
        PATH+="$ANDROID_HOME/tools":"$ANDROID_HOME/platform-tools":"$ANDROID_HOME/cmdline-tools/latest/bin"
        ```

## Resources

## References

## Remarks
