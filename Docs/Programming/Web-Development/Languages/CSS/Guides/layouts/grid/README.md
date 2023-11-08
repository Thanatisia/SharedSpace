# CSS Layouts - Grid

## Basics
### CSS 
#### Keywords
+ `#` : Initialize and specify a new class variable
+ `.` : Initialize and specify a new ID

#### Attributes
+ `height: 100vh;` : Specify general height of the layout/object
+ `width: 100%;` : Specify general width of the layout/object

#### Tags
- div
    + Description: Create a new divider / group
- footer
    + Description: Create a new footer subgroup
- header
    + Description: Create a new header subgroup
    - Options
    + Syntax: `<header><!-- Header Content --></header>
- section
    + Description: This creates new individual sections for every use of the tag
    - Options
        + `id="your-id"` : Specify the DOM ID of the section
    - Syntax: 
        ```html
        <section>
            <!--
            Tags and nested section contents here
            -->
        </section>
        ```
- main
    + Description: Specify a new "main content" subgroup
    - Options
    + Syntax: `<main><!-- Main Content --></main>`
- nav
    + Description: Navigation Bar
    - Options
    + Syntax: `<nav>Nav Content</nav>`

## Documentations
### Synopsis/Syntax
- `#[class-name]`
    - Attributes
        + `display: grid;` : Specify the display method as 'grid'
        - grid-template-areas : Specify the template areas to apply grid layout
            - Structure: `[grid-area-name] [layout-row] [layout-column]`
        - `grid-template-rows: row-1-height row-2-height row-*-height;` : Specify number of rows/"row heights" of each row in the in the template grids
            - Height Formatting
                + px : Pixels
                + 1fr : Take up full remaining height
        - `grid-template-columns: col-1-width col-2-width col-*-width;` : Specify number of columns/"column widths" of each column in the template grids
            - Height Formatting
                + px : Pixels
                + 1fr : Take up full remaining width

### Usage
- Define a basic HTML layout with 
    + a navigation bar (nav) : on the left; vertical, 
    + header
    + main elements
    ```html
    <section id="dashboard">
        <nav><!-- Nav content --></nav>
        <header><!-- Header Contents --></header>
        <main><!-- Main Content --></main>
    </section>
    ```

- Create a CSS layout file
    + Name: grid-dashboard.css

    - Create grid template areas to format the layout you wish to design
        - Attributes
            + Display: grid
            - Areas:
                + nav header header
                + nav content content
                + nav header header
        ```css
        #dashboard {
            display: grid;
            grid-template-areas:
                "nav header header"
                "nav content content"
                "nav header header";
            ...
        ```

    - Set row heights for the rows
        - Attributes
            - Row Heights: 
                + Row 1: 80px; Row 1 will Take up 80px
                + Row 2: 1fr; Row 2 will take up the full remaining height
        ```css
            grid-template-rows: 80px 1fr;
        ```

    - Set column widths for the columns
        - Attributes
            - Column Widths: 
                + Col 1: 250px; Column 1 will take up 250px width
                + Col 2: 1fr; Column 2 will take up the full remaining width
        ```css
            grid-template-columns: 250px 1fr;
        ```

    - Set remaining general attributes and settings
        - Attributes
            + height: 100vh
            + width: 100%
        ```css
            height: 100vh;
            width: 100%;
        }
        ```

    - Define which HTML element corresponds to which grid-template-area
        - nav
            ```css
            nav {
                background: red;
                grid-area: nav;
            }
            ```
        - header
            ```css
            header {
                background: violet;
                grid-area: header;
            }
            ```
        - main
            ```css
            main {
                background: green;
                grid-area: content;
            }
            ```

## Wiki

## Resources

## References

## Remarks
