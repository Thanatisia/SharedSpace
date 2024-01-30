# Mobile Application Development Snippet - Views

## Information

## Views and Widgets
### Buttons
- Frontend
    - XML Layout
        ```xml
    <Button
        android:id="@+id/btn_obj"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Change Text"
        android:textSize="24sp"
        android:layout_centerInParent="true"/>
        ```

- Backend
    - Java
        - Import Dependencies
            ```java
            import android.widget.Button;
            ```
        - Initialization
            ```java
            Button btn_Obj = (Button)findViewById(R.id.btn_obj);`
            ```

### TextView
- Frontend
    - XML Layout
        ```xml
    <!-- Your UI components here -->
    <TextView
        android:id="@+id/tv_obj"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello, Android!"
        android:textSize="24sp"
        android:layout_centerInParent="true"/>
        ```

- Backend
    - Java
        - Import Dependencies
            ```java
            import android.widget.TextView;
            ```
        - Initialization
            ```java
            TextView tv_Obj = (TextView)findViewById(R.id.tv_obj);
            ```
        - Set Texts
            ```java
            tv_Obj.setText("Hello, Android!");
            ```

### EditText
- Frontend
    - XML Layout
        ```xml
    <EditText
        android:id="@+id/et_obj"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:hint="Texts"
        android:textSize="24sp"
        android:layout_centerInParent="true"/>
        ```

- Backend
    - Java
        - Import Dependencies
            ```java
            import android.widget.EditText;
            ```
        - Initialization
            ```java
            EditText et_Object = (EditText)findViewById(R.id.et_obj);
            ```

## Wiki

## Resources

## References

## Remarks

