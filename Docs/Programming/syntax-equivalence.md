# Programming - Syntax Conversion/Equivalence

```
Mapping of various concept syntax in Software Development written in various programming languages
```

## Concepts
- command line arguments
    - c
        ```c
        #include <stdio.h>
        #include <stdlib.h>
        int main(int argc, const char **argv[])
        {
            std::printf("%s", "Arguments:");
            for (int i=0; i<argv.Length; i++)
            {
                std::printf("%d = %s", i, argv[i]);
            }
        }
        ```
    - c++
        ```cpp
        #include <iostream>
        using std::cout;
        using std::cin;
        using std::endl;
        using std::getline;
        int main(int argc, const char **argv[])
        {
            cout << "Arguments: " << endl;
            for (int i=0; i<argv.Length; i++)
            {
                cout << i << " = " << argv[i] << endl;
            }
        }
        ```
    - python
        ```python
        import os
        import sys
        exec = sys.argv[0]
        argv = sys.argv[1:]
        argc = len(argv)

        print("Arguments:")
        for i in range(argc):
            # Get current argument
            curr_arg = argv[i]

            # Print argument
            print("{} = {}".format(i, curr_arg))
        ```

## Terminologies

## Resources

## References

## Remarks
