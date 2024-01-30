# Svelte (and SvelteKit) setup

## Information
- WebApplication Frameworks
    + Svelte: Server UI components framework
    + SvelteKit : Svelte routing utility

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
                + '+layout.svelte' : Svelte route layout file
        - static/ : Place your static assets here (i.e. webapplication static pages, images, favicon.png, robots.txt)
        - tests/  : Place your test files here

### Introduction
- Svelte
    - two basic concepts
        1. Each page of your app is a Svelte component
        2. You create pages by adding files to the src/routes directory of your project. These will be server-rendered so that a user's first visit to your app is as fast as possible, then a client-side app takes over

## Setup
### Dependencies
+ git
+ NodeJS
+ npm
- Node Packages
    + vite
    + sveltejs

### Pre-Requisites
- Install svelte(kit)
    ```console
    npm install -D svelte
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

- Create project structure
    - Create directories
        ```console
        mkdir -p [project-root-directory]/src/routes
        ```

    - Create configuration files
        - Information
            + svelte route layout file: [project-root-directory]/src/routes/+layout.svelte
        ```console
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

- Change directory into source directory
    ```console
    cd [project-root-directory]/src
    ```

- (Optional) Import application CSS files into the Svelte route layout file
    - Information
        + svelte route layout file: [project-root-directory]/src/routes/+layout.svelte
        + You can import any application CSS files this way into the layout so that the route uses the CSS file
    ```javascript
    <script>
        import "../app.css";
    </script>

    <slot />
    ```

## Development

### Building
- Start build process
    - Run development/debug mode
        - Explanation
            + This will start a server in 'localhost:5173' (Default)
        ```console
        npm run dev
        ```

## Documentations
### Syntax/Structure
- To use placeholder variables:
    - Wrap the variable in '%'
        ```html
        %class.attribute%
        ```

### Usage

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

## Resources

## References
+ [Svelte - Interactive Learning - Tutorial - Welcome to Svelte](https://learn.svelte.dev/tutorial/welcome-to-svelte)
+ [SvelteKit - Documentations - Introduction - Getting Started](https://kit.svelte.dev/docs/introduction#introduction-getting-started)
+ [SvelteKit - Documentations - Configuration](https://kit.svelte.dev/docs/configuration)
+ [SvelteKit - Documentations - Modules - Sveltejs-kit-vite](https://kit.svelte.dev/docs/modules#sveltejs-kit-vite)
+ [SvelteKit - Interactive Learning - Tutorial- Introducing SvelteKit](https://learn.svelte.dev/tutorial/introducing-sveltekit)
+ [ViteJS - Homepage](https://vitejs.dev/)
+ [ViteJS - Configurations](https://vitejs.dev/config/)
+ [YouTube - FreeCodeCamp - SvelteKit & TailwindCSS Tutorial – Build & Deploy a Web Portfolio](https://www.youtube.com/watch?v=-2UjwQzxvBQ)

## Remarks
