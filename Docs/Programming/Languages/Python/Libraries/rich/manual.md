# Docs - Python Module : rich

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Name: rich
+ Package Type : Command Line Interface (CLI) Application; Design; ncurses

## Setup

### Pre-Requisites

### Dependencies
- python
- pip

### Installation
- Using PyPi
    ```python
    python -m pip install rich
    ```

## Documentation

### Description

Rich is a Python library for rich text and beautiful formatting in the terminal.

### Synopsis/Syntax

- Import the whole module
    + import rich

- Import classes
    + from rich.[modules] import [class]

### Modules
+ rich : The main rich utilities that focuses on pretty-fying the Command Line Interface
+ rich.panel : Panel-related Widget Functionalities
+ rich.color : Color-related Functionalities

### Classes
#### rich
+ pretty    : Classes to prettify the command line interface

#### rich.panel
+ Panel

#### rich.color
+ Color

### Functions
+ rich.inspect(color, methods={True|False})     : Generate a report on any Python object
- rich.pretty
    + .install()                                : Pretty print with syntax highlighting
- rich.panel.Panel
    + .fit("panel-text", border_style="style")  : Renders a Panel and Fit into CLI
- rich.color.Color
    + .parse("color-value")                     : Parses in the colour value; Examples : {red|blue|green|yellow...}

### Variables

### Usage


## References
+ [ReadTheDocs - Rich Library](https://rich.readthedocs.io/en/stable/introduction.html)

## Resources


## Remarks

