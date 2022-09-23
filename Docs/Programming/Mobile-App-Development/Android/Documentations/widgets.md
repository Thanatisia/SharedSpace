# Android XML

## Layouts (ViewGroups)
- LinearLayout : ViewGroup that arranges views according to absolute values
	- Arrangement by Weight
		+ android:weightSum : Total Weight of all Views
		+ android:layout_weight : Weight of the current view proportional to the total (Weightsum)
			- The higher your percentage, the less space it takes on the screen
- RelativeLayout : ViewGroup that arranges views according to relative positioning; Above|Bottom|Left|Right|Center etc

## Views
- ListView : Display Lists
	- Functions
		- setAdapter
			- Parameters
				+ data_to_populate_listview : Type <ArrayAdapter>; The dataset containing values to place in the list

		- setOnItemClickListener
			- onItemClick : When an item in the list is clicked
				- Parameters
					+ AdapterView : Type <generic>; the View's data adapter
					+ View : Type <view>; The view object (in this case - ListView)
					+ position : Type <int>; The position of the item selected (0 -> last item)
					+ id : Type <long>; The ID of the item selected
				
- Spinner : DropDown List
	- Functions
		- setOnItemSelectedListener : listen for when item is selected
			- onItemSelected: When item is selected
				- Parameters
					+ AdapterView : Type <generic>; the View's data adapter
					+ View : The view
					+ position : Type <int>; The position of the item selected (0 -> last item)
					+ id : Type <long>; The ID of the item selected
			- onNothingSelected : When no items are selected

## Notices
+ Snackbar : Popup notice from the bottom
+ Toast : Popup notification

## Classes
- View
	- Event Listeners
		- .setOnClickListener : When the View/Button is clicked
			- onClick
				- Parameters
					+ View : Type <view>; The View/Widget that was clicked

## Algorithms
- HashMap (Dictionary) : Key-Value Pairs
	- To loop
		```java
		for(String key : hashmap_obj.keySet())
		{
			String curr_val = hashmap_obj.get(key);
		}
		```


## Concepts
### Intent
#### Synopsis/Syntax
	```java
	// Generate new intent
	Intent it = new Intent(context, target_class)

	// Start the Intent
	startActivity(it);

	// Pop off this activity from the stack
	finish();
	```

#### Class
- Intent() : Initialize new Intent
	- Go to another Activity
		- Parameters
			+ Context context : The Activity (page) context
			+ Class target_class : The class you want to go to

## Importing Dependencies
- Edit 'build.gradle' in the project space
	- In the 'dependencies' position
		+ use the 'implementation' command
		```
		dependencies {
			implementation 'aar repository'
		}
		```