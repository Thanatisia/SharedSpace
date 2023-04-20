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
yt-dlp {options} <arguments> [video-url]
```

### Parameters
> This list is incomplete; Please refer to the help/manual/documentations for a full list of options
- Positionals
    - video-url : The URL/link of the target video
        + Type: URL String
- Optionals
    - With Arguments
        - Video Format Options
            + -f [format] | --format [format] : Specify the video/audio encoding format codes to download; Use '[video-format]+[audio-format]' operator/structure to download the video and audio files and merge them together
    - Flags
        - Video Format Options
            + -F | --list-formats : List all available video/audio encoding format codes
        - General Options
            + -h | --help   : Display help and all options
            + -U | --update : Update this program to the latest stable version
            + --no-update   : Do not check for updates (Default)
            + --version     : Display program version and exit

### Snippets and Examples
- Download specific video/audio encoding format(s)
    - Search for your target format(s)
        + Choose a target audio/video format code (i.e. 217)
        ```console
        yt-dlp -F [video-url]
        ```
    - Specify your target format codes to download
        + Use the structure `-f [video-format-code]+[audio-format-code]` to download the video and audio files and merge them together
        ```console
        yt-dlp -f [format(s)] [video-url]
        ```
- Download from Source 
    - Teachables
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
