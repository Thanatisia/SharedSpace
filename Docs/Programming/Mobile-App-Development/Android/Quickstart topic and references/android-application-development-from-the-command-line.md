# Android Application Development from the Command Line

```
Full documentation on Mobile Application Development entirely from the command line 

- i.e.
    - No Android Studio
    - Compilation from the terminal/tty/command line
```

## Information
### Defaults 
#### Environment Variable 
- ANDROID_USER_HOME : $HOME/.android
- ANDROID_AVD_HOME  : $HOME/.android/avd

#### Configuration file locations
- User Configuration Files: $HOME/.android
- Android Virtual Device (AVD): $HOME/.android/avd

## Table of Contents
+ [Setup](#setup)
+ [Development](#development)
+ [Documentations](#documentations)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Setup
### Dependencies
- android sdk : The Android Software Development kit
    - [command line tools](https://developer.android.com/studio#command-tools) : Used for performing android-related actions from the command line
        + avdmanager : CLI utility to install Android Virtual Devices
        + sdkmanager : CLI utility to install Android SDK packages
    + platform-tools
    + build-tools : Used for building android apk files
    + sdk-tools
    + android debug bridge (adb)
    + emulator : Required to use the android emulator; can be used as a standalone application to startup an android emulator for use
+ gradle : The build system used by the Android project structure

### Quickstart Flow
- System Setup
    - Set Environment Variables
        - Android SDK
            - Android_HOME
            - ANDROID_USER_HOME
            - ANDROID_NDK_ROOT
        - Android Emulator
            - ANDROID_EMULATOR_HOME
            - ANDROID_AVD_HOME
        - Programming language-based
            - Java
                - JAVA_HOME
                - JDK_HOME
        - System
            - PATH

    - Preparation
        - Install Android SDK Command Line Tools
        - Install Android SDK packages
        - Verify Installation

    - Generate project structure
        - Create new android project
        - Change directory into newly-created android project
        - Generate project structure
    - Generate Project source files

- Development
    - Build and Run source file
    - Install APK file
    - Run the application

### Pre-Requisites
- Create directories
    - ANDROID_HOME/
        - build-tools/ : Contains the Android application build utilities
        - cmdline-tools/ : Contains the android SDK command line tools package
        - emulator/ : This package is required to use the Android Emulator
        - platform-tools/ : Contains the system/platform-related toolings and applications

### Set Environment Variables
- Notes
    - Ensure that all paths used do not have spaces
        + Android hates spaces

#### Android SDK
- ANDROID_HOME : Set this to the home/root directory of the Android SDK installation; 'ANDROID_SDK_ROOT' was the predecessor but has since been deprecated
    - Linux
        ```console
        ANDROID_HOME="/path/to/android-sdk"
        ```
    - Windows
        ```console
        SET ANDROID_HOME="/path/to/android-sdk"
        ```

- ANDROID_USER_HOME : Sets the path to the data/user preferences directory for tools that are part of the Android SDK. Defaults to '$HOME/.android/'
    - Linux
        ```console
        ANDROID_USER_HOME="/path/to/.android"
        ```
    - Windows
        ```console
        SET ANDROID_USER_HOME="/path/to/.android"
        ```

- ANDROID_NDK_ROOT : Set this to the home/root directory of the Android NDK installation
    - Linux
        ```console
        ANDROID_NDK_ROOT="/path/to/android-ndk"
        ```
    - Windows
        ```console
        SET ANDROID_NDK_ROOT="/path/to/android-ndk"
        ```

#### Android Emulator
- ANDROID_EMULATOR_HOME : Set this to the location of home/root directory of emulator-specific data files
    - Linux
        ```console
        ANDROID_EMULATOR_HOME="/path/to/.android"
        ```
    - Windows
        ```console
        SET ANDROID_EMULATOR_HOME="/path/to/.android"
        ```

- ANDROID_AVD_HOME : Set this to the home/root location of Android Virtual Device (AVD)-specific data files
    - Linux
        ```console
        ANDROID_AVD_HOME="/path/to/.android/avd"
        ```
    - Windows
        ```console
        SET ANDROID_AVD_HOME="/path/to/.android/avd"
        ```

#### Programming Language-specific configurations
- Java
    - JDK_HOME : Sets the home/root location of the Java Development Kit installation
    - JAVA_HOME : Sets the home/root location of the Java installation

#### System
- 'PATH' system path environment variable
    - Append the command line tools and SDK into the system path
        - Paths
            + Command Line Tools Binary: $ANDROID_HOME/cmdline-tools/latest/bin
            + Toolkit Binary: $ANDROID_HOME/tools/bin
            + Platform Tools: $ANDROID_HOME/platform-tools
            + Gradle Binary : /path/to/gradle/bin
        - To append to PATH
            - Linux
                ```console
                PATH+="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:/your/paths:"
                ```
            - Windows
                ```console
                SET PATH="%PATH%;%ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\cmdline-tools\latest\bin;\your\paths;"
                ```

### Preparation
- (Optional) Install Android Platform Tools manually
    - Information 
        - Link : https://dl.google.com/android/repository/platform-tools-latest-[operating-system].zip
            - Operating Systems
                + win : Windows
                + mac : Mac
                + linux : Linux
        + The filename should be 'platform-tools_r[version]-[operating-system]'
        ```console
        wget https://dl.google.com/android/repository/platform-tools-latest-[operating-system].zip
        ```
    - Extract the archive
        - Linux
            ```console
            unzip platform-tools_r[version]-[operating-system].zip -d [destination-directory]
            ```

- Install Android SDK Command Line Tools
    - Information
        + This contains 'sdkmanager' which is used to install the Android SDK packages and components
    - Download command line tools in [here](https://developer.android.com/studio#command-tools)
        - typically URL is 'https://dl.google.com/android/repository/commandlinetools-[operating-system]-[version]_latest.zip'
            - Operating Systems
                + win : Windows
                + mac : Mac
                + linux : Linux
        + The filename should be 'commandlinetools-*-*.zip'
        ```console
        wget https://dl.google.com/android/repository/commandlinetools-win-10406996_latest.zip
        ```
    - Extract the archive
        - Linux
            ```console
            unzip commandlinetools-linux-*.zip -d [destination-directory]
            ```

- Install Android SDK packages and components
    - Information
        - Android SDK components
            + platform-tools
            + build-tools
            + cmdline-tools
    - Using sdkmanager
        - Explanation
            - sdkmanager
                - Synopsis/Syntax
                    ```console
                    sdkmanager [platform-version] [build-tools]
                    ```
            - To install platform tools
                + "platform-tools"
            - To install Android API Platform version support (i.e. API library for a certain android version)
                + "platforms;android-[sdk-version]"
            - To install Android build tools for a certain version
                + "build-tools;[build-tools-version]"
            - To install command-line tools (cmdline-tools)
                + "cmdline-tools;[version]"
                - Version Support
                    + latest
            - To install system images
                - "system-images;[platform-sdk-version];[google_apis];[architecture]"
                    - Parameters
                        + architecture: x86_64
        - Install for Platform 'android-31' and Build Tools version '31.0.0'
            ```console
            sdkmanager "platform-tools" "platforms;android-31" "build-tools;31.0.0" "cmdline-tools;latest" "system-images;android-31;google_apis;x86_64"
            ```

- Verify the installation
    - Check SDK packages
        ```console
        sdkmanager --list
        ```
    - Check all installed packages
        ```console
        sdkmanager --list_installed
        ```
    - Check gradle is installed
        ```console
        gradle --version
        ```

### Generating project filestructure
- Create a new Android project directory
    ```console
    mkdir -p /path/to/parent/directory
    ```

- Change directory into newly-created project directory
    ```console
    cd /path/to/parent/directory
    ```

- Generate the project structure
    - Using 'gradle'
        - Notes
            - To generate a new android project
                - Replace 'library-name' with the library based on the primary programming language you wish to use
                    + Java: java-library
                    + Kotlin: kotlin-library
                ```console
                gradle init --type [library-name]
                ```
        - Generate a new Java-based Android project
            ```console
            gradle init --type java-library
            ```
        - Generate a new Kotlin-based Android project
            ```console
            gradle init --type kotlin-library
            ```

        - (Optional) If gradle wrapper is not found
            - Generate a gradle wrapper script manually
                ```console
                gradle wrapper
                ```

### Generate Project Source File
- Information
    + Please refer to [Templates](#templates) for more information and the files/folders to create

- Create Source Files and classes
    - Create Backend source code directory
        - Syntax
            ```console
            mkdir -p [project-home-directory]/app/src/[branch]/[language]/[company-name]/[project-name]/[application-name]
            ```
        - Examples
            - Java-based backend
                ```console
                mkdir -p [project-home-directory]/app/src/main/java/com/your-project/your-application/
                ```
    - Create Backend source file
        - Syntax
            ```console
            touch [project-home-directory]/app/src/main/java/com/your-project/your-application/MainActivity.[language]
            ```
        - Examples
            - Java-based backend
                ```console
                touch [project-home-directory]/app/src/main/java/com/your-project/your-application/MainActivity.java
                ```

- Create Resources directory
    - Syntax
        ```console
        mkdir -p [project-home-directory]/app/src/[branch]/res/[child-directory-type]
        ```
    - Resources
        - layout  : Frontend layout XML files
            ```console
            mkdir -p [project-home-directory]/app/src/main/res/layout
            touch [project-home-directory]/app/src/main/res/layout/activity_main.xml
            ```
        - drawable: The drawables and assets
            - Explanation
                - Densities
                    + mdpi
                    + hdpi
                    + xhdpi
                    + xxhdpi
            ```console
            mkdir -p [project-home-directory]/app/src/main/res/drawable-{densities}
            ```
        - mipmap : Mipmaps are drawable files primarily to design launcher icons; this folder is for placing your app/launcher icons only
            ```console
            mkdir -p [project-home-directory]/app/src/main/res/mipmap/launcher_file
            ```
        - values : string/text-related XML files
            ```console
            mkdir -p [project-home-directory]/app/src/main/res/values
            touch [project-home-directory]/app/src/main/res/values/strings.xml
            ```

- Modify Application Build Configuration
    - configure dependencies, version numbers, custom gradle tasks and other build settings as needed. 
        - Edit the Module/Application-level build.gradle file
            ```console
            $EDITOR [project-home-directory]/app/build.gradle
            ```
        - Modifications
            - Add Package Dependencies
                - Template
                    ```gradle
                    dependencies {
                        implementation '[organization-name].[package-name]:[type (i.e. library)]:[version-number]'
                        // Add more dependencies here
                    }
                    ```
                - Example
                    ```gradle
                    dependencies {
                        // Add more dependencies here
                    }
                    ```
    - Configure AndroidManifest.xml
        - Explanation
            + The 'AndroidManifest.xml' file is located in the '[project-home-directory]/src/[branch]' directory
            + The 'AndroidManifest.xml' file contains important metadata about your app, including permissions, declared components (activities, services, etc.), and other settings
        - Edit the AndroidManifest.xml file 
            ```console
            $EDITOR '[project-home-directory]/src/main/AndroidManifest.xml' directory
            ```
    - Customize App Icons: 
        - Explanation
            + Replace the default app launcher icons in the res directory with your own icons.
        - Copy png files into the drawable folder with different screen densities
            - mdpi
                ```console
                cp your_icon.png src/main/res/drawable-mdpi
                ```
            - hdpi
                ```console
                cp your_icon.png src/main/res/drawable-hdpi
                ```
            - xhdpi
                ```console
                cp your_icon.png src/main/res/drawable-xhdpi
                ```
            - xxhdpi
                ```console
                cp your_icon.png src/main/res/drawable-xxhdpi
                ```
    - Set Up Version Control:
        + Initialize a version control system (e.g., Git) to track changes in your project.
        - Integrate Third-Party Libraries:
            + Add third-party libraries by specifying their dependencies in your project's build.gradle files.

- Modify Top-layer Build Configurations
    - Configure dependencies, version numbers, custom gradle tasks and other build settings as needed. 
        - Edit the Top-level/Project-level build.gradle script
            ```console
            $EDITOR [project-home-directory]/build.gradle
            ```
        - Modifications
            - Add Build Package and repository Dependencies
                - Template
                    ```gradle
                    buildscript {
                        repositories {
                            google() // Google's Maven Repository
                            jcenter() // JCenter repository
                            // Add any other repositories here if needed
                        }
                        dependencies {
                            classpath '[organization-name].[package-name]:[type (i.e. library/plugin)]:[version-number]'
                            // Add more build dependencies here
                        }
                    }
                    ```
                - Example
                    ```gradle
                    dependencies {
                        // Add more dependencies here
                    }
                    ```

## Development

### Build and Run source code
- Change directory to the root directory of your Android project
    ```console
    cd [project-home-directory]
    ```

- Build android application
    - using gradle build system
        - The gradle build system is similar to the make build system in that
            + like the Makefile, the gradle build file comes with 'tasks' that are like the 'recipes' or 'targets' in Makefiles
        - The build task compiles your source code, processes resources, and 
            + generates the APK (Android application package) file. 
        - Build with Debug
            - If the build is successful, 
                + you'll find the APK file in the 'app/build/outputs/apk/debug' directory.
            ```console
            gradle{w} build
            ```
        - Build a release version
            - If the build is successful, 
                + you'll find the APK file in the 'app/build/outputs/apk/release' directory.
            ```console
            gradle{w} assembleRelease
            ```

### Installation
- After a successful building of the project, you can install and run the application on either 
    + An Android Emulator or
    + A Physical Device

- Using adb
    - Explanation
        + The adb is the 'Android Debug Bridge', a utility used to connect to a virtual or a physical android device and allows you to manage the internal systems on connection
    - List available devices
        ```console
        adb devices
        ```

- Install and run the application on an emulator or device
    - Using gradle build system
        - Deployment
            ```console
            gradle{w} install
            ```
        - With Debugging
            ```console
            gradle{w} installDebug
            ```
        - Install in a specific device based on the device serial number
            - Notes
                + Note the device serial number shown in `adb devices`
            ```console
            gradlew installDebug -s [device-serial-number]
            ```

### Run the Application
- Launch the app on the device 
    - using the 'adb' command
        - Explanation
            + `[organization].[package-name]` : This is your application's package name
            + `[activity-to-launch]` : This is the activity you wish to launch on startup (i.e. MainActivity)
        ```console
        adb shell am start -n [organization].[package-name]/[organization].[package-name].[activity-to-launch]
        ```

- Launch the app on an emulator
    - using the 'emulator' command
        ```console
        emulator -avd [your-emulator-name]
        ```

### Debugging and Monitor your application
- Using the 'adb' command
    - Information
        + You can monitor your application's log output and debug it using 'adb'
    - To view log messages in real time
        ```console
        adb logcat
        ```

### Deployment
#### Generate Signing Key (Private-Public Key Pair)

#### 

## Documentations

### Troubleshooting
#### sdkmanager
- Error: Could not determine SDK root
    - Possible Issues
        + the 'ANDROID_HOME' or 'ANDROID_SDK_ROOT' (Deprecated) environment variable is not set as the SDK root
    - Solutions
        - Use '--sdk_root=[android-sdk-root-directory]' to explicitly specify the Android SDK root directory
            ```console
            sdkmanager --sdk_root=[android-sdk-root-directory] [action]
            ```

### Usage

#### Flutter
- Synopsis/Syntax
- Snippets and Examples
    - To set the path of the Android SDK directory
        ```console
        flutter config --android-sdk [android-sdk-directory]
        ```

#### Gradle Build System
- Synopsis/Syntax
    ```console
    gradlew [task]
    ```

- Tasks
    - Build Commands:
        + assemble: Compiles and assembles the APKs for all build variants.
        + assembleDebug: Builds APK for the debug variant.
        + assembleRelease: Builds APK for the release variant.
        + clean: Cleans the build directory, removing all built files.
    - Installation and Running:
        - `installDebug {options} <arguments>`: Installs the debug APK on the connected device.
            - Options
                + `-s [device-serial-number]` : Special a specific device serial number (if there are multiple devices connected)
        + uninstallDebug: Uninstalls the debug APK from the connected device.
        + installRelease: Installs the release APK on the connected device.
    - Testing:
        + test: Runs all unit tests in the project.
        + connectedAndroidTest: Runs all connected device tests (UI tests) in the project.
    - Dependency Tasks:
        + dependencies: Shows the dependencies of the project.
        + app:dependencies: Shows the dependencies of the app module.
    - Other Useful Commands:
        + tasks: Lists all available Gradle tasks.
        + help: Displays help information about Gradle tasks.

#### Android Command Line Tools
- sdkmanager
    - Pre-Requisites
        + Expected Location: '[android-sdk]/cmdline-tools/latest'
    - Synopsis/Syntax
    - Snippets and Examples
        - To set the path of the Android SDK directory
            ```console
            sdkmanager --sdk_root=[android-sdk-path]
            ```

#### Android Emulator
- Synopsis/Syntax
- Snippets and Examples
    - Starting up an android emulator
        - Using 'emulator'
            ```console
            emulator -avd [your-emulator-name]
            ```

## Wiki

### Templates
- Android Project
    - Explanation
        - This structure represents a minimal setup for an Android application project. 
            + The app/ directory contains the main application code, resources, and configuration files such as the manifest file (AndroidManifest.xml). 
            + The build.gradle files handle module-level and project-level configurations necessary for building and running the Android application.
    - Typical Android Project structure
        - [project-home-directory]/ : The home/root directory of the android project
            + build.gradle : This is the project-level build file used by gradle for handling tasks in the project-level; basically defines configurations related to the entire project, including settings for all modules
            + settings.gradle : Specifies the settings and modules included in the project
            - app/ : Module directory containing most of the application-specific codes
                + build.gradle : The module-level build.gradle file is placed within your android project and contains module-specific configurations and dependencies
                - src/ : Source Code/Activity directory
                    - [branch-name (default: main)]/ : contains the branches of the project
                        + AndroidManifest.xml : The Android Manifest file is like the brain of the application; This contains important metadata about your app, including permissions, declared components (activities, services, etc.), and other settings; Similar to the Manifest file for Kubernetes
                        - [java|kotlin]/ : The language containing the backend source codes and classes; i.e. java/kotlin
                            - [company-name]/ : The company/organization name; can be anything of your choice. Default: com
                                - [project-name]/ : The name of your entire project; a project can have multiple applications
                                    - [application-name]/ : The name of your current application
                                        + source-files... : The source files; i.e. Java = MainActivity.java, Kotlin = MainActivity.kt
                        - res/ : Directory containing resources such as layouts, drawable assets and values
                            - layout/ : Directory containing frontend code that will be linked to the backend source code
                                + activity_main.xml
                            - drawable/ : Drawable files are assets/images that can be added into the project to be displayed in the application
                            - mipmap/ : Mipmaps are drawable files primarily to design launcher icons; this folder is for placing your app/launcher icons only
                            - values/ : string/text-related key-value mapping XML files
                                + colors.xml : Contains color name-value definitions and mappings
                                + strings.xml : Contains string variable key-value mappings
                                + styles.xml : Contains application themes applicable in the application

- AndroidManifest.xml
    - Explanation
        + Permissions: This section is where you declare any permissions your app requires. In this example, it includes the internet permission (android.permission.INTERNET). Add other permissions as necessary for your app's functionality.
        - Application: Defines the attributes for your application.
            + android:allowBackup: Indicates whether the app data can be backed up.
            + android:icon: Specifies the app icon.
            + android:label: Defines the app's display name.
            + android:roundIcon: Specifies the round version of the app icon.
            + android:supportsRtl: Indicates if the app supports Right-to-Left (RTL) layout.
            + android:theme: Specifies the app's theme.
        - Activities: Defines the activities (screens) within your app. 
            - In this example, 
                + there's an <activity> tag for the MainActivity, which is set as the launcher activity using <intent-filter>.
    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <manifest xmlns:android="http://schemas.android.com/apk/res/android"
        package="[organization-name].[project-name].[application.name]">

        <!-- Permissions -->
        <!-- Add any permissions your app requires here -->
        <!-- Example: -->
        <uses-permission android:name="android.permission.INTERNET" />

        <application
            android:allowBackup="true"
            android:icon="@mipmap/ic_launcher"
            android:label="@string/app_name"
            android:roundIcon="@mipmap/ic_launcher_round"
            android:supportsRtl="true"
            android:theme="@style/AppTheme">

            <!-- Activities -->
            <activity android:name=".MainActivity">
                <intent-filter>
                    <action android:name="android.intent.action.MAIN" />
                    <category android:name="android.intent.category.LAUNCHER" />
                </intent-filter>
            </activity>

            <!-- Other components -->
            <!-- Add other components like services, receivers, etc. if needed -->

        </application>

    </manifest>
    ```

- colors.xml
    - Explanation
        + colorPrimary, colorPrimaryDark, and colorAccent are typical colors used in Material Design themes for primary, darker variant, and accent colors respectively.
        + textColor represents a generic text color. 
        + You can use it as a placeholder and later reference this color throughout your app's styles and layouts.
    - Information
        + Place this in the folder 'res/values'
        + This file contains color name-value definition/mappings that you can reference by name instead of statically typing
    ```xml
    <resources>
        <!-- Primary branding color -->
        <color name="colorPrimary">#3F51B5</color>

        <!-- Darker variant of primary color -->
        <color name="colorPrimaryDark">#303F9F</color>

        <!-- Accent color for UI elements -->
        <color name="colorAccent">#FF4081</color>

        <!-- Text color -->
        <color name="textColor">#000000</color>
        
        <!-- Additional colors -->
        <!-- <color name="secondaryColor">#2196F3</color> -->
        <!-- <color name="highlightColor">#FFC107</color> -->
        <!-- Add more colors as needed -->
    </resources>
    ```

- strings.xml
    - Explanation
        + `<resources>`: The root tag that encapsulates all resource definitions.
        + `<string>`: Defines a string resource with a name attribute (name="string_name").
        - `name="app_name"`: The name used to refer to this string in the code.
            + `MyAndroidApp`: The actual string value for the app_name.
    - Information
        + `<string>` tags can be added for each string your app uses, providing a unique name for each string and its corresponding value.
    ```xml
    <resources>
        <!-- App Name -->
        <string name="app_name">MyAndroidApp</string>

        <!-- Example Strings -->
        <string name="hello_text">Hello, Android!</string>
        <string name="welcome_message">Welcome to My Android App</string>

        <!-- Other Strings -->
        <!-- Add other strings used in your app here -->
    </resources>
    ```

- styles.xml
    - Explanation
    - Information
        + Place this in the folder 'res/values'
        + This file contains application themes (aka "styles") which you can apply to the application
    ```xml
    <resources>

        <!-- Base application theme -->
        <style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
            <!-- Customize your theme here -->
            <item name="colorPrimary">@color/colorPrimary</item> <!-- Primary branding color -->
            <item name="colorPrimaryDark">@color/colorPrimaryDark</item> <!-- Darker variant of primary color -->
            <item name="colorAccent">@color/colorAccent</item> <!-- Accent color for UI elements -->
            <!-- Other theme attributes -->

            <!-- ActionBar styles -->
            <!-- Customize ActionBar styles here -->

            <!-- App-wide text appearance -->
            <item name="android:textAppearance">@style/AppTextAppearance</item>

            <!-- Add any other customizations or overrides here -->
        </style>

        <!-- Text Appearance for the entire app -->
        <style name="AppTextAppearance" parent="TextAppearance.AppCompat">
            <!-- Customize text appearance here -->
            <item name="android:textColor">@color/textColor</item> <!-- Default text color -->
            <!-- Other text attributes -->
        </style>

    </resources>
    ```

- Main activity class
    - Java
        ```java
        package [organization-name].[project-name].[application-name];

        import android.os.Bundle;
        import android.support.v7.app.AppCompatActivity;
        import android.widget.TextView;

        public class MainActivity extends AppCompatActivity {
            @Override
            protected void onCreate(Bundle savedInstanceState) {
                super.onCreate(savedInstanceState);
                setContentView(R.layout.activity_main);
                // Your code logic goes here

                TextView textView = findViewById(R.id.textView);
                textView.setText("Hello, Android!");
            }
        }
        ```
    - Kotlin
        ```kotlin
        package [organization-name].[project-name].[application-name];

        import android.os.Bundle
        import androidx.appcompat.app.AppCompatActivity

        class MainActivity : AppCompatActivity() {
            override fun onCreate(savedInstanceState: Bundle?) {
                super.onCreate(savedInstanceState)
                setContentView(R.layout.activity_main)
                // Your code logic goes here
            }
        }
        ```

- Main activity layout file
    - xml
        ```xml
        <?xml version="1.0" encoding="utf-8"?>
        <RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:padding="16dp">

            <TextView
                android:id="@+id/textView"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Hello, Android!"
                android:textSize="24sp"
                android:layout_centerInParent="true"/>
        </RelativeLayout>
        ```

- build.gradle (Module-level)
    - Information
        - The module-level build.gradle file is placed within your android project
            - app/
                - build.gradle (Module-level build file)
    - Explanation
        - Plugin IDs
            + The apply plugin statement in the module-level build.gradle file in an Android project is used to apply various plugins that provide functionalities and configurations for the specific module (such as the app module).
            - The syntax for applying a plugin looks like this:
                ```groovy
                apply plugin: 'plugin_id'
                ```
            + The plugin_id represents the unique identifier of the plugin you want to apply. 
            - For Android projects, commonly used plugins include:
                + com.android.application: Applies the Android application plugin for building Android apps.
                + com.android.library: Applies the Android library plugin for building Android libraries/modules.
                + kotlin-android: Applies the Kotlin Android Extensions plugin for Kotlin projects in Android.
                + kotlin-kapt: Applies the Kotlin Annotation Processing Tools plugin for Kotlin projects that require annotation processing.
    - Java
        ```groovy
        apply plugin: '[plugin-id]'

        android {
            compileSdkVersion [android-sdk-version]
            namespace = "[organization-name].[project-name].[application-name]"
            defaultConfig {
                applicationId "organization-name.project-name.application-name"
                minSdkVersion [android-minimum-sdk-version]
                targetSdkVersion [android-target-sdk-version]
                versionCode [your-codes-current-version-number]
                versionName "your-codes-current-version-name"
                testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
            }
            buildTypes {
                release {
                    // Customize your release build settings if needed
                }
            }
        }

        dependencies {
            implementation 'com.android.support:appcompat-v7:28.0.0'
            implementation 'com.android.support.constraint:constraint-layout:1.1.3'
            
            // Other dependencies as needed for your project
        }
        ```
    - Kotlin
        ```kt
        plugins {
            id '[organization-name].[project-name].[application-name]'
            id 'kotlin-android'
            id 'kotlin-android-extensions'
        }

        android {
            compileSdkVersion [android-sdk-version]
            defaultConfig {
                applicationId "organization-name.project-name.application-name"
                minSdkVersion [android-minimum-sdk-version]
                targetSdkVersion [android-target-sdk-version]
                versionCode [your-codes-current-version-number]
                versionName "your-codes-current-version-name"
                testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
            }
            buildTypes {
                release {
                    // Customize your release build settings if needed
                }
            }
        }

        dependencies {
            implementation 'androidx.appcompat:appcompat:1.4.0'
            implementation 'androidx.core:core-ktx:1.7.0'
            implementation 'androidx.constraintlayout:constraintlayout:2.1.3'
            
            // Other dependencies as needed for your project
        }

        kotlin {
            androidExtensions {
                experimental = true
            }
        }
        ```

- build.gradle (Project-level)
    - Information
        - The project-level build.gradle file is placed at the global-scope such that all settings here affects all modules and projects
            - [project-home-directory]/
                - build.gradle (Project-level build file)
    - Explanation
        + buildscript: Contains information for configuring the build process, including repositories and dependencies required by the build script itself.
        + allprojects: Specifies configuration common to all projects in the root project, such as repositories for fetching dependencies.
        + clean task: A predefined Gradle task to clean the build outputs (deletes the build directory).
    - Notes
        + Remember to adjust the com.android.tools.build:gradle version to the latest available version at the time of your project setup or based on your project requirements.
        - This build.gradle file resides in the root directory of your Android project and is responsible for defining project-wide configurations and dependencies. 
            + You can modify it to add additional repositories, dependencies, or configurations that apply to all modules within your project
        - gradle plugin version
            + Please refer to [Android Developers Guide - Build - Releases - Gradle Plugin](https://developer.android.com/build/releases/gradle-plugin) for the latest version(s) of the Gradle Plugin
    ```groovy
    // Top-level build file where you can add configuration options common to all sub-projects/modules.

    // Declare buildscript repositories
    buildscript {
        repositories {
            google() // Google's Maven repository
            jcenter() // JCenter repository
            // Add any other repositories here if needed
        }
        dependencies {
            classpath 'com.android.tools.build:gradle:[gradle-plugin-version]' // Android Gradle Plugin version
            // Add other build dependencies here if needed
        }
    }

    // All projects in the root project
    allprojects {
        repositories {
            google() // Google's Maven repository
            jcenter() // JCenter repository
            // Add any other repositories here if needed
        }
    }

    // Configuration specific to the root project
    task clean(type: Delete) {
        delete rootProject.buildDir
    }
    ```

- settings.gradle
    - Information
        - This settings.gradle file resides in the root directory of your Android project and is responsible for specifying which modules are included in the project. 
            + If your project consists of multiple modules, you can list them using the include statements, enabling Gradle to recognize and manage these modules as part of the project.
    - Explanation
        + include ':app': This line specifies the inclusion of the app module in your Android project. The :app notation represents the app module's directory structure within your project.
        + You can add other modules by including additional lines following the same pattern (include ':module_name') if your project contains multiple modules or libraries.
        + rootProject.name: Specifies the name of the root project. In this case, it's set to "MyAndroidApp", which is the name of the Android project.
    ```groovy
    // Configure the modules included in the project

    // Include the app module
    include ':app'

    // Include other modules if present
    // For example:
    // include ':library_module'

    // Set the root project
    rootProject.name = "your-root-application-name"
    ```

### Terminologies
+ gradle vs gradlew : gradle is the CLI utility used for the gradle build system while gradlew is the gradle wrapper script

## Resources

## References
+ [Android - Emulator Archive](https://developer.android.com/studio/emulator_archive)
+ [Android Authority - Android SDK Beginner's Tutorial](https://www.androidauthority.com/android-sdk-tutorial-beginners-634376/)
+ [Android Developers Guide - Build - Releases - Gradle Plugin](https://developer.android.com/build/releases/gradle-plugin) for the latest version(s) of the Gradle Plugin
+ [Android Developers Guide - Command Line Tools](https://developer.android.com/tools)
+ [Android Developers Guide - Command Line Tools - sdkmanager](https://developer.android.com/tools/sdkmanager)
+ [Android Developers Guide - Command Line Tools - Variables (Android SDK)](https://developer.android.com/tools/variables#android_home)
+ [Android Developers Guide - Command Line Tools - Variables (Environment)](https://developer.android.com/studio/command-line/variables#envar)
+ [Android Developers Guide - Command Line Tools - Variables (Setting)](https://developer.android.com/tools/variables#set)
+ [StackOverflow - Questions - 8817554 - What is difference between platform tools and SDK tools in Android development?](https://stackoverflow.com/questions/8817554/what-is-difference-between-platform-tools-and-sdk-tools-in-android-development#:~:text=It%20includes%20the%20complete%20set,communicate%20with%20emulator%20or%20device.)
+ [StackOverflow - Questions - 23042638 - How do I set android SDK home environment variable](https://stackoverflow.com/questions/23042638/how-do-i-set-android-sdk-home-environment-variable)

## Remarks
