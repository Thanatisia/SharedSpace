# Using SvelteKit + Tailwind CSS

## Information
### Components
- WebApplication Frameworks
    + SvelteKit : Svelte utility
    + Tailwind : CSS framework

- Project Filesystem Structure
    - root/ : Root directory
        + README.md
        + svelte.config.js : Svelte Configuration File
        + tailwind.config.js : Tailwind Configuration File
        - src/ : The project source code directory
            + app.css : Primary Application css configuration file
            - routes/ : The Svelte routing and configuration directory
                + '+layout.svelte' : Svelte route layout file

## Setup
### Dependencies
+ git
+ NodeJS
+ npm
- Node Packages
    + vite
    + sveltejs
    + tailwindcss
    + postcss
    + autoprefixer

### Pre-Requisites
- Install svelte(kit)
    ```console
    npm install -D svelte
    ```

- Install tailwindcss and its peer dependencies
    - Explanation
        - Parameters
            + -D : Install peer dependencies
    ```console
    npm install -D tailwindcss postcss autoprefixer
    ```

### Project Setup
- Generate new Svelte project structure
    ```console
    npm create svelte@latest [project-name]
    ```

- Change directory into project structure
    ```console
    cd [project-name]
    ```

- Install Tailwind CSS in your project
    ```console
    npx tailwindcss init -p
    ```

- Create project structure
    - Create directories
        ```console
        mkdir -p [project-root-directory]/src/routes
        ```

    - Create configuration files
        - Information
            + Application CSS file: [project-root-directory]/src/app.css
            + svelte route layout file: [project-root-directory]/src/routes/+layout.svelte
        ```console
        touch [project-root-directory]/src/app.css
        touch [project-root-directory]/src/routes/+layout.svelte
        ```

### Project Configurations
- Edit Svelte configuration file
    - Information
        + Svelte Configuration File: svelte.config.js

    - Enable the use of PostCSS in the <style> blocks
        - import 'vitePreprocess' : To enable processing '<style>' blocks as PostCSS
            ```javascript
            import {vitePreprocess} from '@sveltejs/vite-plugin-svelte'
            ```
        - Add 'vitePreprocess()' to the 'preprocess' key in the configuration file
            ```javascript
            const config = {
                ...
                preprocess: vitePreprocess()
            };
            ```

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

- Import the application CSS file into the Svelte route layout file
    - Information
        + svelte route layout file: [project-root-directory]/src/routes/+layout.svelte
    ```javascript
    <script>
        import "../app.css";
    </script>

    <slot />
    ```


## Development
- Start build process
    - Run development/debug mode
        ```console
        npm run dev
        ```

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
