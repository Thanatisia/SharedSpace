# Image Download CLI Utility

## Information
```
gallery-dl is an Image downloader CLI utility to download Image galleries and collections from several image hosting sites.

It is a cross-platform tool with many configuration options and powerful filenaming capabilities.
```

### Package Information
+ Author: mikf
+ Repository Name: gallery-dl
+ Repository URL: https://github.com/mikf/gallery-dl

## Setup
### Dependencies
- Base development packages; for building from source
    + python 3.4+
    + requests

- Optional
    + ffmpeg (binary)
    + yt-dlp | youtube-dl   : Video Downloading
    + PySocks               : SOCKS proxy support
    + brotli | brotlicffi   : Brotli compression support
    + PyYAML                : YAML configuration file support
    + toml                  : TOML configuration file support for Python <3.11
    + SecretStorage         : GNOME keyring passwords for '--cookies-from-browser'

### Pre-Requisites
- Obtaining Source code
    - Using git
        ```console
        git clone https://github.com/mikf/gallery-dl
        ```
    - Change directory
        ```console
        cd gallery-dl
        ```

- Update PyPI (pip) to latest version
    ```console
    python3 -m pip install --upgrade pip
    ```

- Install essential python packages
    + setuptools
    + wheel
    ```console
    python3 -m pip install --upgrade setuptools wheel
    ```

- Install dependencies
    ```console
    python3 -m pip install -U pyinstaller -r requirements.txt
    ```

### Installation
- (Recommended) Using pip
    - From PyPI
        + The stable releases of gallery-dl are distributed on PyPI and can be easily installed or upgraded using pip
            ```console
            python3 -m pip install -U gallery-dl
            ```
    - The latest dev version directly from GitHub
        ```console
        python3 -m pip install -U -I --no-deps --no-cache-dir https://github.com/mikf/gallery-dl/archive/master.tar.gz
        ```
    - A specific branch directly from GitHub
        ```console
        python3 -m pip install -U -I --no-deps --no-cache-dir https://github.com/mikf/gallery-dl/archive/[branch].tar.gz
        ```

## Documentation
### Synopsis/Syntax
```console
gallery-dl {options} <arguments> [<special-characters:>URLS]
```

### Parameters
```
This list is incomplete; Please refer to the [Options](https://github.com/mikf/gallery-dl/blob/master/docs/options.md) for a full list of options
```
- Positionals
    - URLS : The URL/link of the target images, tag searches, websites etc
        + Type: URL String
- Optionals
    - With Arguments
        - Authentication
            - oauth:<sitename> : Specify the name of the website to invoke OAUTH user authentication for the extractor
                - Targets
                    - Required
                        + pixiv
                    - Optional
                        + deviantart
                        + flickr
                        + reddit
                        + smugmug
                        + tumblr
                        + mastodon
            + -p "<password>" : Specify the password for the specified site supporting authentication via username and password
            + -u "<username>" : Specify the username for the specified site supporting authentication via username and password
        - Browser Options
            - --cookies "path/to/cookies.txt" : Explicitly specify the path to the cookies.txt file
            - --cookies-from-browser [browser] : Specify a browser to extract cookies from
        - Chapter Options
            - --chapter-filter "filter" : Specify a filter condition for the chapters to download; Chapter sites involves manga, comics etc.
                - Filter Examples
                    + "min <= chapter < max" : Chapter is more than or equals to the minimum but less than the maximum"
        - General
            + -o [output-filepath] | --output [output-filepath] : Specify an output filepath
        - Image Format Options
            + -f [format] | --format [format] : Specify the video/audio encoding format codes to download; Use '[video-format]+[audio-format]' operator/structure to download the video and audio files and merge them together
    - Flags
        - Image Format Options
            + -F | --list-formats : List all available video/audio encoding format codes
        - General Options
            + -h | --help   : Display help and all options
            + -U | --update : Update this program to the latest stable version
            + --no-update   : Do not check for updates (Default)
            + --version     : Display program version and exit

- Special Characters
    ```
    When placed in front of the URLs, the special character may perform different actions
    ```
    + `r:[URLs]` : Search a remote resource for URLs and download images from them
    + `<extractor>:[URLs]` : If a site's address is nonstandard for its extractor, you can prefix the URL with the extractor's name to force the use of a specific extractor

### Usage
- Download images from websites via search query
    ```console
    gallery-dl "https://url/search-query"
    ```

- Download an image from the direct URL of a site supporting authentication via username and password
    ```console
    gallery-dl -g -u "<username>" -p "<password"> "https://url/to/site/image"
    ```

- Filter manga chapters by chapter number
    ```console
    gallery-dl --chapter-filter "filter" "https://manga.domain/title/id-of-manga"
    ```

- Filter manga chapters by language
    ```console
    gallery-dl -o "lang=[LANGUAGE-2-Letter-ISO]" "https://manga.domain/title/id-of-manga"
    ```

- Search a remote resource for URLs and download images from them
    - Examples
        + A list of URLs within a text file in a remote location like GitHub, pastebin etc
    + URLs for which no extractor can be found will be silently ignored
    ```console
    gallery-dl "r:[URL]"
    ```

- Explicitly prefix the URL with the extractor's name to force the use of a specific extractor
    + If a site's address is non-standard for its extractor
    ```console
    gallery-dl "<extractor>:[URL]"
    ```

### Snippets and Examples
- Download images from danbooru via tag search
    ```console
    gallery-dl "https://danbooru.donmai.us/posts?tags=[search-keyword]"
    ```

- Filter manga chapters by chapter number
    ```console
    gallery-dl --chapter-filter "10 <= chapter < 20" "https://manga.domain/title/id-of-manga"
    ```

- Filter manga chapters by language
    ```console
    gallery-dl -o "lang=fr" "https://manga.domain/title/id-of-manga"
    ```

- Search a remote resource for URLs and download images from them
    - Search for URLs listed in a textfile compilation (like a whitelist/blacklist) found on github user contents
        ```console
        gallery-dl "r:https://raw.githubusercontent.com/[author]/[repository]/[branch]/tree/[path-to-text-file]"
        ```
    - Search for URLs listed in a textfile compilation found on pastebin
        ```console
        gallery-dl "r:https://pastebin.com/raw/FLwrCYsT"
        ```

- If a site's address is non-standard for its extractor
    - Tumblr
        ```console
        gallery-dl "tumblr:https://sometumblrblog.example"
        ```

### Configurations
- Package Configuration Locations
    ```
    gallery-dl searches for configuration files in the following places
    ```
    - Windows
        + User's Roaming Application Directory: %APPDATA%\gallery-dl\config.json
        + User's Home Directory: %USERPROFILE%\gallery-dl\config.json
        + User's Home Directory: %USERPROFILE%\gallery-dl.conf
    - *NIX-based (Linux, MacOS etc)
        + Default system installation configuration file: /etc/gallery-dl.conf
        + User's gallery-dl Configuration Directory: ${XDG_CONFIG_HOME}/gallery-dl/config.json
        + User's gallery-dl Configuration Directory: ${HOME}/.config/gallery-dl/config.json
        + User's Home Directory: ${HOME}/.gallery-dl.conf

## Wiki

## Resources
+ [gallery-dl Options](https://github.com/mikf/gallery-dl/blob/master/docs/options.md)

## References
+ [Configuration Options](https://github.com/mikf/gallery-dl/blob/master/docs/configuration.rst)
+ [Filenaming Capabilities](https://github.com/mikf/gallery-dl/blob/master/docs/formatting.md)
+ [Supported Sites](https://github.com/mikf/gallery-dl/blob/master/docs/supportedsites.md)
+ [Nightly Builds](https://github.com/mikf/gallery-dl/actions/workflows/executables.yml)

## Remarks
