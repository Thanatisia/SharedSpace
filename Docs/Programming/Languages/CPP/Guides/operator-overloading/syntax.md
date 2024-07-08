# C++ Syntax - Operator Overloading

## Documentations

### Synopsis/Syntax

```cpp
inline [return-type] operator<your-operator>(const &[data-type] lhs, type params, ...) {
    // Your new statements
    return res;
}
```

### Usage

> Define class to import for operator overloading

```cpp
class Overloading {
private:
public:
    inline bool operator==(const &int lhs, const &int rhs) {
        // Statements here
        bool res = false;

        // Process statement
        if (lhs == rhs) {
            res = true;
        }

        // Return/Output
        return res
    }
}
```

> Main class

```cpp
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <string>
using std::cin;
using std::cout;
using std::endl;
using std::getline;

int main(int argc, const char *argv[]) {
    // Initialize class object constructor
    Overloading cs_overload = new Overloading();

    if (5 == 5) {
        printf("%s", "True");
    }

    return 0;
}
```

## Resources

## References

## Remarks

