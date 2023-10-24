# Jupyter Notebook Converter

## Table of Contents
- Documentations
    + [Synopsis/Syntax](#synopsis/syntax)
    + [Parameters](#parameters)
- Usage Contents
    + [Converting](#converting)

## Documentations
### Synopsis/Syntax
```console
jupyter nbconvert {options} <arguments> [ipython-notebook-file]
```

### Parameters
- Positionals
    - IPython Notebook File : The target ipython/jupyter notebook file you wish to convert
        + File Type: ipynb
        
- Optionals
    - With Arguments
        - --to=[target-type] : Specify the target file type you want to convert the IPython Jupyter Notebook into
            - Supported File Types
                + html : .html file
                + markdown : .md file
                + python : .py file
        + --output=[output-file] : Explicitly specify the output file name
        + --output-dir=[output-directory] : Explicitly specify the output directory path and name
    - Flags
        + --generate-config : Generates a configuration file for the notebook in the '~/.jupyter' directory


## Usage Contents
### Converting
- Convert IPython Jupyter Notebook (.ipynb) to Python script (.py)
    ```console
    jupyter nbconvert --to=python --output=main.py file.ipynb
    ```

## Wiki

## Resources

## References

## Remarks

