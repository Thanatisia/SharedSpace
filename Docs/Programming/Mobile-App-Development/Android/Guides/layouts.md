# Android App Development - Intents

## Information
### DESCRIPTION
```
In Android, Layouts defines the structure for a User Interface in your application.

Generally, Layouts are used in an Activity, however, it is not the only place
```

### Basics
- All elements in the layout are built using a hierarchy of View and ViewGroup objects
	- View : Usually draws something the user can see and interact with
		+ Usually called "widgets"
	- ViewGroup : An invisible container that contains multiple views and viewgroup objects as well as defines their layout structures
		+ Usually called "Layouts"

- This can be visualized as such
	```
			ViewGroup		|
		    	    |			|
	    	    ----------------		|
	    	    |	    |      |		|
		ViewGroup  View  View		| Downwards
	    	    |				|
	  -------------------			|
	  |	    |	    |			|
	View	  View	  View			V
	```

## List of ViewGroups/Layouts
+ ConstraintLayout	: Views are positioned at relative space, but is constrained and "chained" by where each view is placed.
+ LinearLayout		: Views are positioned at absolute space. LinearLayout positions the views at specific positions.
+ RelativeLayout	: Views are positioned at relative space, not absolute space. Whereby the positioning are in the form of "beside: @id/view"