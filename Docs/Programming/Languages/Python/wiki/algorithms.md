# Python - Useful Data Structures and Algorithms examples, explanation and snippets

## Data Structures
### Containers
- dict : Dictionary
    - Properties
        - Key-Value container
        - Similar to a HashMap/Associative Array
        - Is not ordered
    - Useful uses
        - Ordering multiple lists according to a primary 'leader' list
            - By converting the leader list into a dictionary using the elements of the list as the dictionary keys
                - Then iterate through the leader list and check if the current element is found in the subsequent candidate lists
                    - Order the candidate elements accordingly

- sets
    - Properties
        - Does not contain duplicates (contains one of each element)
            - Good for filtering out duplicates by 
                1. converting the list into a set, removing duplicates within the list
                2. convert the set back into a list
                3. Sort the list accordingly
        - Is not ordered (similar to Dictionary/Key-Value data structures)

### Lists
#### Data Sanitization
- Removing new lines
    ```python
    def sanitizer(target_list:list):
        """
        Sanitize the target list by removing new lines from the last element (if exists)

        :: Params
        - target_list : The list you wish to sanitize and remove empty elements from
        """
        # Initialize Variables
        sanitized_list = target_list.copy()
        empty_indexes = []

        # Loop through list and look for newlines
        for i in range(len(sanitized_list)):
            # Get current element
            curr_val:str = sanitized_list[i]

            # Check for new line
            if "\n" in curr_val:
                # Right-Strip newlines from the string
                curr_val = curr_val.rstrip()

                # Replace with removed string
                sanitized_list[i] = curr_val

        # Loop through list and look for empty blocks
        sanitized_list = list(filter(None, sanitized_list))

        # Output
        return sanitized_list
    ```

#### Finding
- Differences between lists
    ```python
    def find_differences(src_list, target_list):
        """
        Compare the sources list to the target 'difference' list and check if there are any missing elements that are found in the sources (primary) list but not in the difference (target) list
        by ordering the source list according to the difference list (List that you want to find the missing elements from) based on the element 'keys' order

        :: Params
        - src_list : The primary list that you want to use to cross-reference the missing elements from the difference list
            Type: List

        - target_list : The target list you want to cross-reference with the source list
            Type: List
        """
        # Initialize Variables
        new_list = [] # The new source list with duplicates removed
        difference = [] # List of duplicates found in the sources list
        src_element_Map = {} # Dictionary containing count of items

        # Loop through source list and 
        # map out number of each elements in the list
        for i in range(len(src_list)):
            # Get current element
            curr_element = src_list[i]

            # Check if current element is in the new list
            if curr_element not in target_list:
                # Element not in the target comparison list

                # Append differences
                difference.append(curr_element)

        # Output
        return difference
    ```

- Duplicates within a single list
    ```python
    def find_duplicates(src_list):
        """
        Check for any duplicates in the source list and returns the de-duplicated list, and the duplicates list

        :: Params
        - src_list : The primary list that you want to use to cross-reference the missing elements from the difference list
            Type: List
        """
        # Initialize Variables
        new_list = [] # The new source list with duplicates removed
        duplicates = [] # List of duplicates found in the sources list
        src_element_Map = {} # Dictionary containing count of items

        # Loop through source list and 
        # map out number of each elements in the list
        for i in range(len(src_list)):
            # Get current element
            curr_element = src_list[i]

            # Check if current element is in the new list
            if curr_element not in src_element_Map:
                # Element not in counter dictionary/map

                # Append into new list
                new_list.append(curr_element)

                # Map new element with default counter in key-value
                src_element_Map[curr_element] = 0

            # Increment key counter
            src_element_Map[curr_element] += 1

        # Loop through key-value mapping and 
        # search for elements with more than 1 count
        for k,v in src_element_Map.items():
            if v > 1:
                # Append into duplicates list
                duplicates.append(k)

        # Output
        return [new_list, duplicates]
    ```

### Sets
#### Removing Duplicates
- Snippets
    ```python
    def remove_duplicates(target_list):
        """
        Using sets to remove all duplicate values from the list by converting it into a set

        :: Params
        - target_list : The list you wish to remove duplicates from
            Type: List
        """
        # Initialize Variables

        # Convert list into set
        set_without_duplicates = set(target_list)
        
        # Convert set back into list
        list_without_duplicates = sorted(list(set_without_duplicates))
        
        # Output
        return list_without_duplicates
    ```

### Dictionary
#### Structure Order
- Snippets
    ```python
    def order_list(order_leader_list, order_follower_list):
        """
        Order a 'follower' list according to an order 'leader' list based on the element 'keys' order

        :: Params
        - order_leader_list : The primary list you wish for the other follower lists to base its element order to
            Type: List

        - order_follower_list : The list you want to order according to the leader list
            Type: List
        """
        # Initialize Variables
        res_list = [] # Result list to hold all values

        # Convert the leader list into dictionary by using the list elements as keys to follow
        leader_dict = dict.fromkeys(order_leader_list) 

        # Convert the follower list into dictionary using the list elements as keys to follow
        follower_dict = dict.fromkeys(order_follower_list)

        # Loop through all keys of the leader dictionary
        for curr_key in leader_dict:
            # Check if the current leader key is in the current follower dictionary
            if curr_key in follower_dict:
                # Current leader key not in the current follower dictionary
                # Append current leader key into results list
                res_list.append(curr_key)

        # Convert list into dictionary using the list elements as keys to remove duplicates
        result_dict = dict.fromkeys(res_list)

        # Retrieve the keys only and convert into the results list
        res_list = list(result_dict.keys())

        # Return list
        return res_list
    ```


## Algorithms

## Wiki

## Resources

## References

## Remarks

