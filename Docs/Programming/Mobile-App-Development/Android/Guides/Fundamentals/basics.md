# Android - Application Fundamentals

## Basics
### Infrastructure
+ The Android Operating System operates on a stack system, meaning it follows a First-in-Last-Out (FILO) stack structure.
- It starts with your first page (Typically 'MainActivity'). 
	- For each 'intent' to move to the next 'page'
		+ The new Activity will be stacked on top of 'MainActivity'
	- This loop will repeat until the application closes or
		+ The user presses back and pops all the activities out of the stack back down to MainActivity
- Example
	```
	  Activity-4  <-------------------------------------------------|------->|
	  Activity-3  <---- (User clicks on button to go to 'Page-4') ->|	 | User Presses Back 3-Times
	  Activity-2  <---- (User clicks on button to go to 'Page-3') ->|	 |
	 MainActivity ----- (User clicks on button to go to 'Page-2') ->|<-------|
	--------------
	```

## Application Components
```
App components are the building blocks of an Android application.

Each component is an entry point through which the system and/or a user can communicate with your application.
```
- Activities		: Basically like the 'pages' within an android application.
	+ This is generally a single screen with a User Interface (UI).
- Services		: Basically background processes that are running for various reasons.
	- There are 2 types of services that tells the system how to manage an application
		- Started Services : Tells the system to keep them running until their work is completed.
			- Examples
				+ sync some data in the background
				+ music playback in the background
		- Bound Services : Services ran due to another application using your application as a dependency.
- Broadcast Receivers 	: Enables the system to deliver events to the application outside of a regular user flow.
	+ Allows System-Wide Broadcast announcements
- Content Providers	: Manages a shared set of appdata that you can store in the filesystem in any persistent storage locations
	- Examples
		+ SQLite Database
		+ JSON
		+ Online in a web

## References
+ [Android Developer Documentations - Component Fundamentals](https://developer.android.com/guide/components/fundamentals)


