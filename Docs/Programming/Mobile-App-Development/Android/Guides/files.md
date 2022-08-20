# Android Development Filesystem

Files and documentation of files in a typical Android Mobile App Development workspace file structure

## General Skeleton
```
    /
    |
    |-- .gradle/
    |-- app/
	|
	|-- build/
	|-- libs/
	|-- src/
	    |
	    |-- androidTest/
	    |-- main/
		|
		|-- java/
		    |
		    |-- com/
			|
			|-- [organization-name]/
			    |
			    |-- [project-name]/
				|
				|-- ActivityClass
		|-- res/
		    |
		    |-- drawable/
		    |-- drawable-v24/
		    |-- layout/
			|
			|-- activity_layout.xml
		    |-- mipmap-{anydpi-v26,hdpi,mdpi,xhdpi,xxhdpi,xxxhdpi}/
		    |-- values/
			|
			|-- colors.xml
			|-- strings.xml
			|-- themes.xml
		    |-- xml/
		|-- AndroidManifest.xml
	    |-- test
	|-- .gitignore
	|-- build.gradle
	|-- proguard-rules.pro
    |-- gradle/
    |-- build.gradle
    |-- gradle.properties
    |-- gradlew
    |-- gradlew.bat
    |-- local.properties
    |-- README.md
    |-- settings.gradle
```

## Android Manifest
### DESCRIPTION
``` 
The AndroidManifest.xml file is the heart of an android application development project workspace

It contains the instructions of what to compile, add or remove in the APK bundle
```

### Basics
- Declaring Components
	+ The primary task of the manifest is to inform the system about the app's components
	- Elements
		+ <application> : The application tag that contains the information of the application
			- Attributes
				- android:icon : Points to 'resources' folder for an icon that identifies the app; Basically the icon that you want to compile with
					- Example:
						+ @drawable/app_icon.png
		+ <activity> : Contains information and attributes for the specified activity (aka 'Page')
			- Attributes
				- android:name : Specifies the fully qualified class name of the Activity subclass
					- Example:
						+ com.[organization-name].[project-name].[activity-name]
				- android:label : Specifies a string ('@string') to use as the user-visible label for the activity
					- Example:
						+ @string/example_label
		+ <service> : Contains information and attributes for the specified services
		+ <receiver> : Contains information and attributes for the specified broadcast receivers
		+ <provider> : Contains information and attributes for the specified content providers

### General Structure
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.organisation-name.project-name">

    <application
        android:allowBackup="true"
        android:dataExtractionRules="@xml/data_extraction_rules"
        android:fullBackupContent="@xml/backup_rules"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.CSIT321FYPAPK"
        tools:targetApi="31">
        <activity
            android:name=".MainActivity"
            android:label="Application Name"
            android:exported="{true|false}">
            <intent-filter>
                <!-- Set as Main Activity -->
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
    </application>

</manifest>
```
