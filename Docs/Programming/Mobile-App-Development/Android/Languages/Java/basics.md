# Android App Development - Java Basics

Documentation, Guides on Android App Development (Native) using Java

## Fundamentals
### Initialization
- To initialize a widget object
	+ [Widget-Object-Class] [variable_Name] = (Widget-Object-Class)findViewById(R.id.[your-widget-id]);
- To initialize a new onClickListener : When a clickable object/widget is pressed, the onClickListener functions will run
	```java
	[widget-variable].setOnClickListener(new View.OnClickListener() {
		@Override
		public void onClick(View view) {
			// Codes here
		}
	});
	```

## Widgets
> List of widgets in a Java-XML Implementation
- Button : A Button Widget
	- Syntax and Synopsis
		+ To Initialize
			```java
			Button btn_Variable = (Button)findViewById(R.id.[your-widget-id]);
			```
- TextView : Similar to a Label
	- Syntax and Synopsis
		+ To Initialize
			```java
			TextView tv_Variable = (TextView)findViewById(R.id.[your-widget-id]);
			```
- EditText : Similar to TextBox
	- Syntax and Synopsis
		+ To Initialize
			```java
			EditText et_Variable = (EditText)findViewById(R.id.[your-widget-id]);
			```
		- To get text input string
			+ Use 'EditText.getText()' to get the text
			+ Use '.toString()' to convert the object into String
			```java
			String result = et_Variable.getText().toString();
			```
- RadioButton : A radio (circle) button that allows only 1 input; Usually used to get a true/false state or condition checker
	- Syntax and Synopsis
		+ To Initialize
			```java
			RadioButton rbtn_Variable = (RadioButton)findViewById(R.id.[your-widget-id]);
			```
- CheckBox : An option chooser widget that allows for selecting multiple input
	- Syntax and Synopsis
		+ To Initialize
			```java
			CheckBox chk_Variable = (CheckBox)findViewById(R.id.[your-widget-id]);
			```

## Events
```
These are unique action functions that performs system events when triggered, i.e. onCreate => When the application activity instance is first created
```
+ onCreate : Actions for when the application/activity instance is first created.
+ onClick : When the widget/object is clicked


## Classes

### Debugging
> Some useful debugging functions
- Toast : Android's implementation/equivalence of a Popup messagebox function
	- Functions
		- ToastObject = Toast.makeText(context, text, duration); : Create a Toast text object to show
			- Parameters
				- context : The activity/object you want this to be applied to
					- Examples
						+ MainActivity.this
						+ Activity.this
						+ Class.this
				- text : The text you would like to display/show
				- duration : How long to display
					+ 0 = Toast.LENGTH_SHORT
					+ 1 = Toast.LENGTH_LONG
		+ ToastObject.show(); : Display/Show/Popup the Toast text object
	- Variables
		- Durations
			+ Toast.LENGTH_SHORT : defined as '0'; Duration for less than 30 seconds
			+ Toast.LENGTH_LONG : defined as '1'; Duration for more than 30 seconds
