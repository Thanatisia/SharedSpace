# yt-dlp

## Information
+ yt-dlp is a fork of the Terminal/CLI Video Downloader 'youtube-dl' project with additional features and fixes

### Package Information
+ Author: yt-dlp
+ Repository Name: yt-dlp
+ Repository URL: https://github.com/yt-dlp/yt-dlp

## Setup
### Pre-Requisites

### Dependencies
+ python 3.7+
- Base development packages; for building from source
    + make
    + zip
    + pandoc
    + pytest
- Optional
    - Recommended
        + ffmpeg (binary)
        + ffprobe
    - Metadata
        + mutagen
        + AtomicParsley
        + xattr | pyxattr | setfattr
    - Misc
        + pycryptodomex
        + phantomJS
        + secretstorage
        + any external downloaders to use with `--downloader`
    - Networking
        + certifi
        + broli | brotlicffi
        + websockets

### Obtaining
- Source code
    - Using git
        ```console
        git clone https://github.com/yt-dlp/yt-dlp
        ```
    - Change directory
        ```console
        cd yt-dlp
        ```

### Compile
> If you are manually building the package from source
- (Recommended) Standalone PyInstaller builds 
    - Install dependencies
        ```console
        python3 -m pip install -U pyinstaller -r requirements.txt
        ```
    - Make lazy extractors
        ```console
        python3 devscripts/make_lazy_extractors.py
        ```
    - Build
        ```console
        python3 pyinst.py
        ```
- Platform-independent Binary (UNIX)
    - Dependencies
    - Using make
        - Build binary
            ```console
            make
            ```
        - Compile only the binary without updating any of the additional files
            ```console
            make yt-dlp
            ```
- Standalone Py2EXE Builds (Windows)
    - Install dependencies
        ```console
        python3 -m pip install -U py2exe -r requirements.txt
        ```
    - Make lazy extractors
        ```console
        python3 devscripts/make_lazy_extractors.py
        ```
    - Build
        ```console
        python3 setup.py py2exe
        ```

### Installing

## Documentation
### Synopsis/Syntax
```console
yt-dlp {options} <arguments>
```

### Parameters
+ `TBC`

### Snippets and Examples
- Download from Teachables
    - Pre-Requisites
        1. Obtain the URL of the video's page
        2. Obtain the link of the m3u8 encoded video cache file
            + Open the `Developers Tools`/`Web Tools`
            + Go to the `Network` tab
            + Type into the filter 'm3u8'
            - Refresh the webpage and startup the video
                + Wait for a m3u8 row containing the word/substring 'master' somewhere in the text
                - Once you see the 'master' item
                    + Right click on that row
                    - Select "Copy"
                        + Select "to Link" to copy the path to the cache
    - Synopsis/Syntax
        ```console
        yt-dlp {options} --referer [video-page-URL] [mu8r-cache-link]
        ```
    - Usage
        - Default
            ```console
            yt-dlp --referer [video-page-URL] [m3u8-cache-link]
            ```
        - Output custom file name
            ```console
            yt-dlp -o [output-file-name] --referer [video-page-URL] [m3u8-cache-link]
            ```

## Wiki

## Resources

## References
+ [Reddit - youtubedl - teachable hack](https://www.reddit.com/r/youtubedl/comments/105zhx1/teachable_hack/)
+ [Reddit - ytdlp FAQ and basic operations](https://old.reddit.com/user/krimsen/comments/uzpaaq/ytdlp_faq_and_basic_operation_tips_and_tricks/)
+ [Reddit - Not able to download from teachable](https://old.reddit.com/r/youtubedl/comments/v0h7su/not_able_to_download_from_teachable/iah7606/)

## Remarks
