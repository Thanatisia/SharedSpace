# MongoDB: Operators

## Comparison
- $and : Operator for logical 'AND'
    - Syntax : 
        ```js
        {$and : [{condition},...]}
        ```
    - Explation
        + Comparison: if "condition1" && "condition2" ...
        + All conditions specified must be TRUE
        + AND can take in multiple values
        + condition specified must be in an array
- $eq : Operator for finding Equality
    - Syntax : 
        ```js
        { "key" : {$eq : condition} }
        ```
    + Comparison: if "key" = "value"
- $gt : Operator for finding "Greater Than"
    - Syntax : 
        ```js
        { "key" : {$gt : condition} }
        ```
    - Comparison: if "key" > "value"
- $lt : Operator for finding "Less Than"
    - Syntax : 
        ```js
        { "key" : {$lt : condition} }
        ```
    - Comparison: if "key" < "value"
- $not : Operator for logical Negation or 'NOT'
    - Syntax : 
        ```js
        {$not : {condition}}
        ```
    - Comparison: if one condition to negate
- $nor : Operator for multiple-condition logical Negation or 'NOT'
    - Syntax : 
        ```js
        {$nor : [{condition}, ...]}
        ```
    - Comparison if multiple conditions to negate
- $or : Operator for logical 'OR'
    - Syntax : 
        ```js
        {$or : [{condition},...]}
        ```
    - Comparison: if "condition1" || "condition2" ...
        + If either condition is TRUE
        + OR can take in multiple values
        + condition specified must be in an array

## Data Manipulation
- $inc : Operator for increment
    - Syntax : 
        ```js
        {$inc : {"key" : amount_to_increase}}
        ```
- $set : Operator to set a new attribute
    - Syntax : 
        ```js
        {$set : {"key" : new_attribute}}
        ```
- $mul : Operator for multiplying a value
    - Syntax : 
        ```js
        {$mul : {"key" : amount_to_multiply_by}}
        ```
- $rename : Operator to rename a key in a document
    - Syntax : 
        ```js
        {$rename : {"old-key-name" : "new-key-name"}}
        ```
- $unset : Operator to delete an attribute 
    - Syntax : 
        ```js
        {$unset : {"key-to-remove" : null}}
        ```
- $currentDate : Operator to set the current date
    - Syntax : 
        ```js
        {$currentDate : {"key" : true}}
        ```

## Wiki

## Resources

## References

## Remarks

