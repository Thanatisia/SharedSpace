# Gradle Build System - build.gradle file customization

## Customization
### Creating a custom task
- Edit the project/top-level gradle file
    ```console
    $EDITOR [project-workspace-path]/build.gradle
    ```
- Add a new task using the 'task' keyword
    - Information
    - Structure
        - `task [task-name] {statements...}` : Define a new task to execute; similar to Makefile's targets/rules
            - `[operation-flow] {statements...}` : Specify the operation flow to execute the specified statements when task is executed
                - Operational Flows
                    - doLast : Do the contained statements last
                        ```groovy
                        task [task-name] {
                            doLast {
                                // Statements to do last here
                            }
                        }
                        ```
                - Statements
                    + `def variable = [value]` : To create a new variable, use the 'def keyword'
                    - `file('file-name')` : To open/define a file object
                        + `[file-object].write(contents)` : Write the specified contents to the specified file

## Documentations
### Usage
- Using a gradle task
    ```console
    ./gradlew [task-name]
    ```

## Resources

## References

## Remarks

