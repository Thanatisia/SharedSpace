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
``` 
The AndroidManifest.xml file is the heart of an android application development project workspace

It contains the instructions of what to compile, add or remove in the APK bundle
```

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
