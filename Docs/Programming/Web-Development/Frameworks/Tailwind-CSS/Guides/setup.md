# Tailwind CSS Setup

## Information
- WebApplication Frameworks
    + Tailwind : CSS framework

- Typical Tailwind Project Filesystem Structure
    - root/ : Root directory
        + README.md
        + tailwind.config.js : Tailwind Configuration File
        - src/ : The project source code directory
            + app.css : The application CSS configuration file; To be imported into the server routing layout component
        - static/ : Place your static assets here (i.e. webapplication static pages, images, favicon.png, robots.txt)
        - tests/  : Place your test files here

## Setup
### Dependencies
+ git
+ NodeJS
+ npm
- Node Packages
    + tailwindcss
    + postcss
    + autoprefixer

### Pre-Requisites
- Install tailwindcss and its peer dependencies
    - Explanation
        - Parameters
            + -D : Install peer dependencies
    ```console
    npm install -D tailwindcss postcss autoprefixer
    ```

- Create project filesystem structure
    - Directories
        ```console
        mkdir -p [project-root-directory]/src
        ```

### Project Setup
- Change directory into an existing project structure
    ```console
    cd [project-root-directory]
    ```

- Install Tailwind CSS in your project
    ```console
    npx tailwindcss init -p
    ```

### Project Configurations
- Edit Tailwind configuration file
    - Information
        + Tailwind Configuration File: tailwind.config.js
    - Configure template paths
        - Add the paths to all of your template files in the 'content' key
            ```javascript
            export default {
                content: [
                    './src/**/*.{html,js,svelte,ts}',
                    /* your other paths here ... */,
                ],
                ...
            };
            ```

- Change directory into source directory
    ```console
    cd [project-root-directory]/src
    ```

- Create project Application CSS file
    - Information
        + Application CSS file: [project-root-directory]/src/app.css

    - Add the Tailwind directives ('@tailwind') for each of Tailwind's layers to the 'app.css' file
        - Explanation
            + `@[css-library/class-name] [variable]` : To import an external library/class
        ```css
        @tailwind base;
        @tailwind components;
        @tailwind utilities;
        ```

## Development

## Documentations

### Usage
#### To use Tailwind in the project
- For any '<style>' blocks that need to be processed by Tailwind
    + Set 'lang="postcss"' to that block parameter
    ```svelte
    <style lang="postcss">
        :global(html) {
            background-color: theme(colors.gray.100);
        }
    </style>
    ```

## Wiki
### Tailwind CSS Attributes
- Classes
    + text-3xl  : Set text to size XXXL (3XL)
    + font-bold : Set bold font
    + underline : Set underline

## Resources

## References
+ [Tailwind CSS - Documentations - Guides - SvelteKit](https://tailwindcss.com/docs/guides/sveltekit)
+ [YouTube - FreeCodeCamp - SvelteKit & TailwindCSS Tutorial – Build & Deploy a Web Portfolio](https://www.youtube.com/watch?v=-2UjwQzxvBQ)

## Remarks
