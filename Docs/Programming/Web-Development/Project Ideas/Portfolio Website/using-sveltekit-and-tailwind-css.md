# Create a Portfolio website using SvelteKit + Tailwind CSS

## Information
### Components
- WebApplication Frameworks
    + Svelte: Server UI components framework
    + SvelteKit : Svelte routing utility
    + Tailwind : CSS framework

- Typical Svelte Project Filesystem Structure
    - root/ : Root directory
        + README.md
        + package.json : node dependencies/packages file; Must include '@sveltejs/kit', 'svelte' and 'vite' as devDependencies
        + svelte.config.js : Svelte and SvelteKit Configuration File
        + jsconfig.js : (Optional) Javascript configuration file; Use this if you prefer type-checked .js files over .ts files; This configures Javascript instead of Typescript
        + tsconfig.js : (Optional) Typescript configuration file; Use this if you are using Typescript instead of Javascript
        + vite.config.js : Vite configuration file; A SvelteKit project is really just a Vite project that uses the '@sveltejs/kit/vite' plugin, along with any other Vite configurations
        - src/ : The project source code directory
            - app.html : Your application html page; This is your page template - containing the following placeholders
                + %sveltekit.head%       : <link> and <script> elements needed by the app, plus any <svelte:head> content
                + %sveltekit.body%       : the markup for a rendered page. This should live inside a <div> or other element, rather than directly inside <body>, to prevent bugs caused by browser extensions injecting elements that are then destroyed by the hydration process. SvelteKit will warn you in development if this is not the case
                + %sveltekit.assets%     : either paths.assets, if specified, or a relative path to paths.base
                + %sveltekit.nonce%      : a CSP nonce for manually included links and scripts, if used
                + %sveltekit.env.[NAME]% : this will be replaced at render time with the [NAME] environment variable, which must begin with the publicPrefix (usually PUBLIC_). It will fallback to '' if not matched.
            - error.html : Your application error html page; This page is rendered when everything else fails. This can contain the following placeholders
                + %sveltekit.status%        : the HTTP status
                + %sveltekit.error.message% : the error message
            + hooks.client.js : Client Hooks javascript file
            + hooks.server.js : Server Hooks javascript file
            + service-worker.js : Service worker definitions javascript file
            + .test.js : (Optional) If you added Vitest when you setup your project; This will contain your unit tests
            - lib/    : Contains your application libraries (utilities and components); can be imported via the '$lib' alias
                - server/ : Place your server-only libraries here; can be imported (only in server code) via the '$lib/server' alias
            - params/ : Place your param matchers here
            - routes/ : The Svelte routing and configuration directory; Contains the routes of your application
                + '+page.svelte'   : Svelte default site page file
                + '+layout.svelte' : Svelte default route layout file
                - [page-folder-name] : This is the page route definitions folder; the folder is the name of the subpage/route
                    + '+page.svelte'   : Svelte site page file for the current page
                    + '+layout.svelte' : Svelte route layout file for the current page
        - static/ : Place your static assets here (i.e. webapplication static pages, images, favicon.png, robots.txt)
        - tests/  : Place your test files here

- Svelte + Tailwind Project Filesystem Structure
    - root/ : Root directory
        + README.md
        + svelte.config.js : Svelte Configuration File
        + tailwind.config.js : Tailwind Configuration File
        - src/ : The project source code directory
            + app.css : Primary Application css configuration file
            - routes/ : The Svelte routing and configuration directory
                + '+layout.svelte' : Svelte route layout file

### Introduction
- Svelte
    - two basic concepts
        1. Each page of your app is a Svelte component
        2. You create pages by adding files to the src/routes directory of your project. These will be server-rendered so that a user's first visit to your app is as fast as possible, then a client-side app takes over

    - Every route is separated into individual folders (i.e. routes/[route/page-name]/{+page.svelte, +layout.svelte, ...})
        - i.e.
            - src/routes/
                - page-1/ : This folder contains the definitions and page content files for this page/route
                    + '+layout.svelte'
                    + '+page.svelte'
                - page-2/ : This folder contains the definitions and page content files for this page/route
                    + '+layout.svelte'
                    + '+page.svelte'
                - page-N/ : This folder contains the definitions and page content files for this page/route
                    + '+layout.svelte'
                    + '+page.svelte'
        - To access
            - In the web search bar
                - Enter the webpage address 'http(s)://[server-ip-address]:[port-number]/[page-N]
                    - Explanation
                        + server IP address : The hostname/address of the Webserver
                        + port number       : The application port number of the Webapplication
                        + page-N            : The route/page name

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
    npm install -D vite svelte
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

- Install Svelte and SvelteKit dependencies
    ```console
    npm install
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
### Creating Portfolio Website
- 

### Building
- Start build process
    - Run development/debug mode
        - Explanation
            + This will start a server in 'localhost:5173' (Default)
        ```console
        npm run dev
        ```

- To access
    - In the web search bar
        - Enter the webpage address 'http(s)://[server-ip-address]:[port-number]/[page-N]
            - Explanation
                  + server IP address : The hostname/address of the Webserver
                  + port number       : The application port number of the Webapplication
                  + page-N            : The route/page name

## Documentations
### Svelte
#### Syntax/Structure
- To use placeholder variables:
    - Wrap the variable in '%'
        ```html
        %class.attribute%
        ```

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
### Svelte Placeholder Attributes
#### Template Page
+ %sveltekit.head%       : <link> and <script> elements needed by the app, plus any <svelte:head> content
+ %sveltekit.body%       : the markup for a rendered page. This should live inside a <div> or other element, rather than directly inside <body>, to prevent bugs caused by browser extensions injecting elements that are then destroyed by the hydration process. SvelteKit will warn you in development if this is not the case
+ %sveltekit.assets%     : either paths.assets, if specified, or a relative path to paths.base
+ %sveltekit.nonce%      : a CSP nonce for manually included links and scripts, if used
+ %sveltekit.env.[NAME]% : this will be replaced at render time with the [NAME] environment variable, which must begin with the publicPrefix (usually PUBLIC_). It will fallback to '' if not matched.

#### Error Page
+ %sveltekit.status%        : the HTTP status
+ %sveltekit.error.message% : the error message

### Tailwind CSS Attributes
- Classes
    + text-3xl  : Set text to size XXXL (3XL)
    + font-bold : Set bold font
    + underline : Set underline

## Resources

## References
+ [Svelte - Interactive Learning - Tutorial - Welcome to Svelte](https://learn.svelte.dev/tutorial/welcome-to-svelte)
+ [SvelteKit - Documentations - Introduction - Getting Started](https://kit.svelte.dev/docs/introduction#introduction-getting-started)
+ [SvelteKit - Documentations - Configuration](https://kit.svelte.dev/docs/configuration)
+ [SvelteKit - Documentations - Modules - Sveltejs-kit-vite](https://kit.svelte.dev/docs/modules#sveltejs-kit-vite)
+ [Tailwind CSS - Documentations - Guides - SvelteKit](https://tailwindcss.com/docs/guides/sveltekit)
+ [ViteJS - Homepage](https://vitejs.dev/)
+ [ViteJS - Configurations](https://vitejs.dev/config/)
+ [YouTube - FreeCodeCamp - SvelteKit & TailwindCSS Tutorial – Build & Deploy a Web Portfolio](https://www.youtube.com/watch?v=-2UjwQzxvBQ)

## Remarks
