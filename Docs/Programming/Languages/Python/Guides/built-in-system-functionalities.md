# Python built-in Functionalities

## Information
### Summary
+ Collection of Python built-in features, snippets, tips and tricks

## Snippets
### Python package management
- List all packages installed
    - Using module 'pkg_resources'
        - Import the attribute 'working_set'
            + 'pkg_resources.working_set' will return a list containing all packages installed in the current system's python packages
            + you can use this to check if package exists
            + This is the same as calling 'pip._vendor.pkg_resources.working_set'
        - Importing
            ```python
            import pkg_resources
            ```
        - Print all packages
            ```python
            print([p.project_name for p in pkg_resources.working_set])
            ```
        - Check if a list of dependencies/requirements exists
            ```python
            dependencies = [""]

            # Get all packages
            installed_pkgs = pkg_resources.working_set.copy()

            # Loop through all dependencies
            for pkg in dependencies:
                # Check if modules/package exists
                if not (pkg in installed_pkgs):
                    # Package not installed
                    print("Package {} is not installed".format(pkg))
                else:
                    # Package is installed
                    print("Package {} is installed".format(pkg))
            ```
    - Using module 'pkgutil'
        - Import the function iter_modules()
            + pkgutil.iter_modules() will return a list containing all packages installed in the current system's python packages
            + you can use this to check if package exists
        - Importing
            ```python
            from pkgutil import iter_modules
            ```
        - Print all packages
            ```python
            print([p.name for p in iter_modules()])
            ```
        - Check if a list of dependencies/requirements exists
            ```python
            dependencies = [""]

            # Get all packages
            installed_pkgs = iter_modules()

            # Loop through all dependencies
            for pkg in dependencies:
                # Check if modules/package exists
                if not (pkg in installed_pkgs):
                    # Package not installed
                    print("Package {} is not installed".format(pkg))
                else:
                    # Package is installed
                    print("Package {} is installed".format(pkg))
            ```

## Documentations

## Wiki

## Resources

## References

## Remarks