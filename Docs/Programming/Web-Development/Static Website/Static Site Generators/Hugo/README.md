# Static Site Generator - Hugo

## Information
### Summary
```
Hugo is a static site generator written in Go, optimized for speed and designed for flexibility. With its advanced templating system and fast asset pipelines, Hugo renders a complete site in seconds, often less.

Due to its flexible framework, multilingual support, and powerful taxonomy system, Hugo is widely used to create:

    + Corporate, government, nonprofit, education, news, event, and project sites
    + Documentation sites
    + Image portfolios
    + Landing pages
    + Business, professional, and personal blogs
    + Resumes and CVs
```

### Project
+ Author: gohugoio
+ Name: hugo
- Repositories
    + GitHub: https://github.com/gohugoio/hugo
- Variants
    + Standard
    - Extended
        + Encode to the WebP format when processing images: You can decode WebP images with either edition.
        + Transpile Sass to CSS using the embedded LibSass transpiler: The extended edition is not required to use the Dart Sass transpiler.

## Quickstart Flow

### Initial Startup
- Generate a new site and create the directory structure for your project in the site
    ```console
    hugo new site quickstart
    ```
- Change directory into the root of your project
    ```console
    cd quickstart
    ```
- Initialize an empty git repository for the project
    ```console
    git init
    ```
- (OPTIONAL) Clone a theme repository into the 'themes' directory and add it as a git submodule to your project
    ```console
    git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
    ```
- Append `theme = [your-theme]` to a new line in the site configuration file
    + This specifies the current theme
    ```console
    echo "theme = 'ananke'" >> hugo.toml
    ```
- Start Hugo's development server to view the site
    + Hugo supports hot reloading; You do not need to stop the server to reload
    - Production
        ```console
        hugo server
        ```
    - Draft
        ```console
        hugo server {-D | --buildDrafts}
        ```

### Add Content
- Add a new page to your site
    + Hugo will create this new post markdown file in the 'contents/posts' folder
    ```console
    hugo new content posts/[post-file].md
    ```

### Publishing
- Publish
    ```console
    hugo server
    ```

## Setup
### Dependencies
+ git : Required for [installing themes as a git submodule, building hugo from source, using the hugo modules feature, hosting the site]
+ c compiler : gcc; clang
+ go  : Required for [building hugo from source, using the hugo submodule feature]
- Optionals
    + [Dart SASS](https://gohugo.io/hugo-pipes/transpile-sass-to-css/#dart-sass) : Required to transpile Sass to CSS when using the latest feature of the Sass language

### Pre-Requisites
- Setup environment variables
    + GOBIN  : Contains the binary installation directory/path
    + GOPATH : Contains the Golang system path

### Build from Source
- Build, Compile and Install using go
    - Standard Edition
        ```console
        go install github.com/gohugoio/hugo@latest
        ```
    - Extended Edition
        ```console
        CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest
        ```       

- Test
    ```console
    hugo version
    ```

## Documentations


## Wiki

### Themes
+ [GitHub - devcows/hugo-universal-theme](https://github.com/devcows/hugo-universal-theme)
+ [GitHub - manid2/hugo-xterm](https://github.com/manid2/hugo-xterm)
+ [GitHub - samrobbins85/hugo-developer-portfolio](https://github.com/samrobbins85/hugo-developer-portfolio)
+ [GitHub - theNewDynamic/gohugo-theme-ananke](https://github.com/theNewDynamic/gohugo-theme-ananke)
+ [GitHub - vaga/hugo-theme-m10c](https://github.com/vaga/hugo-theme-m10c)

## Resources
+ [DEV - Jay Delisle - How to build site navigation with Hugo](https://dev.to/jdelisle/how-to-build-site-navigation-with-hugo-5719)
+ [Medium - gdg-vit - Building a personal portfolio website with Hugo](https://medium.com/gdg-vit/building-a-personal-portfolio-website-with-hugo-7e8604d5e877)
+ [YouTube - Fireship - Hugo in 100 Seconds](https://www.youtube.com/watch?v=0RKpf3rK57I)
+ [YouTube - Techno Tim - Meet Jekyll - The Static Site Generator](https://www.youtube.com/watch?v=F8iOU1ci19Q)

## References
+ [Hugo Static Site Generator - Content Management - Menus](https://gohugo.io/content-management/menus/)
+ [Hugo Static Site Generator - Documentations](https://gohugo.io/documentation)
+ [Hugo Static Site Generator - Quickstart](gohugo.io/getting-started/quick-start/)
+ [Hugo Static Site Generator - Installation - Windows](https://gohugo.io/installation/windows/)

## Remarks


