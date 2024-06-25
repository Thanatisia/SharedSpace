# Rust - Frameworks - WASM - Quick setup and quickstart development flow

## Initial Setup
1. Install the crate(s) 'wasm-pack'
    ```bash
    cargo install wasm-pack
    ```

2. Create a new rust project for the WASM library
    - Explanation
        - This will create a new project in Rust with the following structure
            ```
            root/
            - Cargo.toml
            - src/
                - lib.rs
            ```
    ```bash
    cargo new --lib [wasm-project-name]
    ```

3. Configure your Cargo.toml configuration file

> Package

```toml
[package]
name = "hello-wasm"
version = "0.1.0"
authors = ["Your Name <you@example.com>"]
description = "A sample project with wasm-pack"
license = "MIT/Apache-2.0"
repository = "https://github.com/yourgithubusername/hello-wasm"
edition = "2021"
```

> Package Dependencies

```toml
[dependencies]
wasm-bindgen = "0.2"
```

> (Optional) If library

```toml
[lib]
crate-type = ["cdylib"]
```

4. Write a simple WASM function

- Edit 'src/lib.rs'
    - Import the WASM libraries
        + wasm_bindgen : Used to communicate between WASM and javascript
        ```rust
        use wasm_bindgen::prelude::*;
        ```
    - Define all external prototype functions to be imported from the external library into the rust program, and Map the attribute 'wasm_bindgen' to the extern
        - Explanation
            + The external prototype functions defined here are tied to the externally-imported Javascript functions in 'wasm_bindgen'
        ```rust
        #[wasm_bindgen]
        extern {
            pub fn alert(s: &str);
        }
        ```
    - Implement a rust WASM function that will interface with the javascript function to be executed on the DOM when communicating with the Webserver
        ```rust
        #[wasm_bindgen]
        pub fn greet(name: &str) {
            alert(&format!("Hello, {}!", name));
        }
        ```

5. Compile the package for the web to generate libraries that will be imported/used within web applications
    - Explanation
        - By importing the rust-compiled javascript libraries,
            + The webserver will obtain the interfacing rust functions and execute the rust functions (if used within the web application's code)
    - Build the package using wasm-pack for the web
        - Explanation
            + Compiles your Rust code to WebAssembly.
            + Runs wasm-bindgen on that WebAssembly, generating a JavaScript file that wraps up that WebAssembly file into a module the browser can understand.
            + Creates a pkg directory and moves that JavaScript file and your WebAssembly code into it.
            + Reads your Cargo.toml and produces an equivalent package.json.
            + Copies your README.md (if you have one) into the package.
        ```bash
        wasm-pack build --target web
        ```

6. Use the package on the web by importing the compiled WASM module into your webpage/application/site

> Create an `index.html` root page file in the root of the project

- Explanation
    - Within the body of the project (You can do this whereever necessary in your project)
        - If embedding within the HTML file internally instead of externally importing
            + Wrap the javascript code within a module javascript block
            ```html
            <script type="module">
            </script>
            ```
        - Import the compiled WASM module javascript file into your project
            - Notes
                + Module is also known as library in javascript
            ```js
            import init, {greet} from "./pkg/hello_wasm.js";

            // Initialize module and run the function
            init().then(() => {
                greet("WebAssembly");
            });
            ```

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>hello-wasm example</title>
    </head>

    <body>
        <!-- Import compiled WASM library/module in the body -->
        <script type="module">
            import init, {greet} from "./pkg/hello_wasm.js";

            // Initialize module and run the function
            init().then(() => {
                greet("WebAssembly");
            });
        </script>
    </body>
</html>    
```

- Startup and serve a local webserver on the root directory of the project
    - Notes
        + You should see an alert popup corresponding to the rust code
    - Using python `http.server` module
        ```bash
        python3 -m http.server
        ```

## Resources

## References

## Remarks


