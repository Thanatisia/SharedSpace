# Terminal Mode Functions

## General
- help : Get the first help from shell
- db.help() : Help on database methods
- db.version() : Get current database version
- show dbs : Show database names (same as 'show databases')
- show collections : Show collections in current database
- use db_name : Set current database

## Files
- To run a script
    - Syntax : 
        ```js 
        load('filepath/filename')
        ```

## Database
- Setting a current database / creating and switching to a new database
    - Syntax : 
        ```js 
        use [database-name]
        ```
    - Examples:
        - database name: local
            ```js 
            use local
            ```

- Get Database Name
    - Syntax : 
        ```js 
        db.getName()
        ```

- Drop/Delete a Database
    - Syntax : 
        ```js
        db.dropDatabase()
        ```

## Listing
- Listing all databases
    - Syntax : 
        ```js
        show dbs
        ```

- Listing all collections
    - Syntax : 
        ```js 
        show collections
        ```

## Collections
- Insert collection with a document
    - Explanation
        + System will autogenerate a unique ObjectID for the collection
    - Syntax : 
        ```js 
        db.[collection_name].insert({"key" : "value"})
        ```
    - Examples:
        - Creating a new empty document
            ```js
            db.[collection_name].insert({})
            ```
        - Creating a new non-empty document
            ```js
            db.[collection_name].insert({"one" : "1", "many ones" : [1,1,1,1]})
            ```

- Insert collection with an array of values
    - Syntax : 
        ```js
        db.[collection_name].insert([values,...])
        ```

- Find total number of documents in collection
    - Syntax : 
        ```js 
        db.[collection_name].count()
        ```

- List the contents of a collection
    - Note: 
        - if not specified, .find() will find everything in the collection
    - Syntax : 
        ```js 
        db.[collection_name].find({"key" : "value"})
        ```
    - Usages:
        - Multiple Conditions (AND)
            - Notes
                - ',' is interpreted as an "AND" condition
                    + condition {key1 : value1} must equal to {key2 : value2}
            ```js
            db.[collection_name].find(
                {
                    $and : [
                        "key-1" : "value-1",
                        "key-2" : "value-2"
                    ]
                }
            )
            ```
        - Multiple Conditions (OR)
            - Notes
                - $or : Operator for logical 'OR'
                    + OR can take in multiple values
                    + condition specified must be in an array
                    + Either condition-1 or condition-2 must be TRUE
            ```js
            db.[collection_name].find(
                {
                    $or : [
                        {"key-1" : "value-1"},
                        {"key-2" : "value-2"}
                    ]
                }
            )
            ```

- List the contents of a collection with formatting
    - Syntax : 
        ```js 
        db.[collection_name].find({"key" : "value"}).pretty()
        ```

- Update Document in Collection
    - Note:
        + If you dont specify a source or target, it will replace the whole collection of documents with empty
    - Syntax : 
        ```js 
        db.[collection_name].update({target-document-key-value}, {key-values-to-update})
        ```
    - Usage:
        - To Increment
            ```js
            db.[collection_name].update(
                {"source-key" : "source-id-value"},
                {
                    $inc : {
                        "key-to-increment" : amount-to-increment
                    }
                }
            )
            ```
        - To Multiply
            ```js
            db.[collection_name].update(
                {"source-key" : "source-id-value"},
                {
                    $mul : {
                        "key-to-multiply" : amount-to-multiply
                    }
                }
            )
            ```
        - To set a new value
            ```js
            db.[collection_name].update(
                {source-key} : "source-ID-value"},
                {
                    $set : {
                        "key-to-set" : attribute-to-set
                    }
                }
            )
            ```
        - To create a key-value attribute with the current date
            ```js
            db.[collection_name].update(
                {source-key} : "source-ID-value",
                {
                    $currentDate : {
                        "key-name" : true
                    }
                }
            )
            ```
        - To rename a key in a document
            ```js
            db.[collection_name].update(
                {source-key} : "source-ID-value"},
                {
                    $rename : {
                        "old-key-name" : "new-key-name"
                    }
                }
            )
            ```
        - To delete an attribute
            ```js
            db.[collection_name].update(
                {source-key} : "source-ID-value"},
                {
                    $unset : {
                        "key-to-remove" : null
                    }
                }
            )
            ```


    - Remove Document from Collection
        - Note: 
            + If document ({"key" : "value"}) is not specified : Removes every record if not specified
        - Syntax : 
            ```js 
            db.[collection_name].remove(document)
            ```

    - Drop/Delete Collection
        - Note:
            + Unlike a RDBMS, dropping wont have any warning messages
        - Syntax : 
            ```js 
            db.[collection_name].drop()
            ```

## Notes
- Always try to put in your own '_id' into your document
    - So that the document has its own ID and 
        - MongoDB will automatically not add that item if it already exists in the collection
    - To avoid duplicate data

- MongoDB 
    - Always keep a script
    - Backup the documents and collections

