# JavaScript snippets and examples: Leftpad

## Information
### Explanation
- Leftpad just stands for left-padding
    + Basically, prepending N number of spaces (aka 'paddings') to the left of the provided string
- Algorithm:
    - The goal of leftpads is to add N spaces (paddings) to the left of the provided string
        - Ways of performing this operation
            1. Loop [count] number of paddings and concatenate to a resulting string, then append the provided string
            2. Take the provided string, inverse/rotate and append [count] number of paddings to the end of the reversed string (which will be the head of the string array)

## Documentations
### Components
- Parameter/Argument Signature
    - msg : The message string you want to pad [count] number of spaces to the left
        + Type: String
    - count : Number of pads you want to prepend to the string
        + Type: Integer

## Snippet
### Implementation
```javascript
function leftpad(msg, count) {
    // Initialize Variables
    let res = "";

    for(let i=0; i <= count; i++) {
        // Accumulate all spaces
        res += " ";
    }

    res += msg;

    // Output
    return res;
}
```

### Usage
```javascript
function main() {
    var res = leftpad("Hello World", 5);

    console.log(`Padded Message: ${res}`);
}

if (require.main === module) {
    main();
}
```

## Wiki

## Resources

## References

## Remarks
