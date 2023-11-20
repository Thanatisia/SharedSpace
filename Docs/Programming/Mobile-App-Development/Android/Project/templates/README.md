# Android Application Development - Templates

## Information
### Components
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
                    - values : string/text-related key-value mapping XML files

### Project Structure
- Explanation
    - This structure represents a minimal setup for an Android application project. 
        + The app/ directory contains the main application code, resources, and configuration files such as the manifest file (AndroidManifest.xml). 
        + The build.gradle files handle module-level and project-level configurations necessary for building and running the Android application.

- Typical Android Project structure
    - [project-home-directory]/
        + build.gradle
        + settings.gradle
        - app/
            + build.gradle
            - src/
                - main
                    + AndroidManifest.xml
                    - [language]/
                        - [company-name]/
                            - [project-name]/
                                - [application-name]/
                                    + MainActivity.{kt|java}
                    - res/
                        - layout/
                            + activity_main.xml
                        - drawable/
                        - values
                            + strings.xml

## Source Files
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
        ```groovy
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
            classpath 'com.android.tools.build:gradle:7.0.4' // Android Gradle Plugin version
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

## Wiki

## Resources
## References
## Remarks
