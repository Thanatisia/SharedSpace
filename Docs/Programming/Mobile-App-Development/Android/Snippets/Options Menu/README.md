# Android App Development Snippets - Options Menu

## Frontend
- XML
	+ Path : menu/menu.xml
	```xml
	<?xml version="1.0" encoding="utf-8"?>
	<menu
		xmlns:android="http://schemas.android.com/apk/res/android"
		xmlns:app="http://schemas.android.com/apk/res-auto"
		xmlns:tools="http://schemas.android.com/tools">

		<item
			android:id="@+id/menu_option_id"
			android:title="Menu Option Name"
			android:icon="@drawable/icon">
		</item>
	</menu>
	```

## Backend
- Java
	```java
	@Override 
	public boolean onCreateOptionsMenu(Menu menu) {
		/*
		 * Inflates a target menu (appears at the top)
		 */

		// Initialize MenuInflater to Inflate your options menu
		MenuInflater inflater = getMenuInflater();

		// Inflates a menu of your choice - repeatable to inflate multiple menus
		inflater.inflate(R.menu.[your-options-menu-xml], menu);

		// Return true to show the menu, return false to hide
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(@NonNull MenuItem item) {
		/*
		 * When a Menu Item in the Options Menu is selected
		 */
		int item_ID = item.getItemId();
		switch(item_ID)
		{
			/*
			 * Switch through the items
			 */
			case R.id.[menu-option-id]:
				// When the option is selected
				// R.id.menu_options_id is in Integer
				break;
			default:
				// Invalid Option
				break;
		}
		return super.onOptionsItemSelected(item);
	}
	```

