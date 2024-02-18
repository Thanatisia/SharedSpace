# yt-dlp

## Information
+ yt-dlp is a fork of the Terminal/CLI Video Downloader 'youtube-dl' project with additional features and fixes

### Package Information
+ Author: yt-dlp
+ Repository Name: yt-dlp
+ Repository URL: https://github.com/yt-dlp/yt-dlp

### Project Filesystem Structure
- Configuration Files
    + System-wide configuration file: /etc/yt-dlp.conf
    + User-specific configuration file: ~/.config/yt-dlp/config

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
> If you are installing from a pre-built binary
- Using package manager
    - apt
        - Package: 
            + yt-dlp : Stable
            + yt-dlp-git : Development
        ```console
        sudo apt install yt-dlp{-git}
        ```
    - pacman
        - Package: 
            + yt-dlp : Stable
            + yt-dlp-git : Development
        ```console
        sudo pacman -S yt-dlp{-git}
        ```

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
        - General Options
            + -o [output-filepath] | --output [output-filepath] : Specify an output filepath
        - Browser Options
            + --cookies-from-browser <browser> : To import cookies from the specified browser
        - Download Options
            + --download-archive [archive-file-name] : Download all videos from the list of video URLs specified in the provided `archive-file-name`
        - External Usages
            + --external-downloader [external-downloader] : Specify the external downloader you want to use instead of the default website; Examples: aria2
            + --external-downloader-args '[arguments ...]' : Specify the arguments to parse into the external downloader of choice
        - Subtitles
            + --sub-lang [LANGUAGE,] : to specify the subtitles to download (comma separated)
        - Video Format Options
            + -f [format] | --format [format] : Specify the video/audio encoding format codes to download; Use '[video-format]+[audio-format]' operator/structure to download the video and audio files and merge them together
    - Flags
        - Audio Options
            + -k : If an audio-only stream is not available; Use this to keep the downloaded video as by default, that scenario will download the video and copy its audio as post process and remove the downloaded video
            + -x : For Audio-only downloads; Use this alongside `-f <Best Audio>` to select the audio codec you want to download; Requires ffmpeg
        - Download Options
            + --continue : To continue downloading even after interruption
            + --ignore-errors : Ignore any error or interruptions
            + --no-overwrites : Do not overwrite files even after interruption
        - General Options
            + -h | --help   : Display help and all options
            + -U | --update : Update this program to the latest stable version
            + --no-update   : Do not check for updates (Default)
            + --version     : Display program version and exit
        - Metadata and Information Options
            + --add-metadata : Download the video with metadata included
            + --embed-thumbnail : TO also include album art; Requires package 'atomicparsley'
        - Subtitles
            + --list-subs : List all available subtitle languages
            + --write-sub : To download a video with selected subtitles; Used with '--sub-lang <LANGUAGE>' to specify the subtitles to download (comma separated)
            + --write-auto-sub : To download auto-generated subtitles
            + --skip-download : To get only subtitles
        - Video Format Options
            + -F | --list-formats : List all available video/audio encoding format codes
        - Workarounds
            + --legacy-server-connect : Explicitly allow HTTPS connection to servers that do not support RFC 5746 secure renegotiations. Only do this if downloads errors out (i.e. with a 'Forbidden' scenario)

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
- Faster Downloads using External Downloader
    - Some websites throttle transfer speeds
        - You can often get around this by
            + Choosing non-DASH streams or
            + by using 'aria2' : An external downloader that supports multi-connection downloads
                ```console
                yt-dlp --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' [URL]
                ```
- Extract Audio
    - Notes
        + Requires ffmpeg
    - Parameters
        + Use '-x' for Audio-only downloads by extracting the audio
        + Use '-F' to search for a list of available audio
        - Use '-f <best audio>' to select the best audio to download
            + Append an '[ext=<extension>]' behind the <best audio> to rename it to the extension
        ```console
        yt-dlp -x -f <best audio>[ext=<extension>] [URL]
        ```
    - If an audio-only stream is not available
        - Exclude '-f <best audio>'
            + By default, this will remove the downloaded video, include '-k' to keep the downloaded video
        ```console
        yt-dlp -x -k [URL]
        ```
    - To also include album art
        - Notes
            + Requires package 'atomicparsley'
        - Parameters
            + Use '--add-metadata' to include metadata into the audio
            + Use '--embed-thumbnail' to add the album art/thumbnail into the audio file
        ```console
        yt-dlp -x -f <best audio>[ext=m4a] --add-metadata --embed-thumbnail [URL]
        ```
- Subtitles
    - To see which languages are available
        ```console
        yt-dlp --list-subs [URL]
        ```
    - To download a video with selected subtitles (comma separated)
        ```console
        yt-dlp --write-sub --sub-lang <LANGUAGES,...> [URL]
        ```
    - To download auto-generated subtitles
        ```console
        yt-dlp --write-auto-sub --sub-lang <LANGUAGES,...> [URL]
        ```
    - To download only subtitles
        ```console
        yt-dlp --skip-download --write{-auto}-sub --sub-lang <LANGUAGES,...> [URL]
        ```
- Cookies
    - To import cookies from a browser
        ```console
        yt-dlp --cookies-from-browser <browser-name> [URL]
        ```
- Playlist
    - Typical options
        ```console
        yt-dlp --ignore-errors --continue --no-overwrites --download-archive progress.txt <other options> [URL]
        ```

- Error Troubleshooting
    - 'Forbidden' in websites without credentials required
        - Pre-Requisites
            - Ensure that the website does not require tokens and/or credential authentication and authorization
                + The following example does not include options used for websites that requires logging in
        ```console
        yt-dlp --legacy-server-connect [URL]
        ```

### Configuration
- Structure
    - Basically you add each option in a new line within the configuration file and
        + The specified options will be loaded on runtime and ran by default
    + One command-line option per line

- Comments
    + Use '#'

- Syntax/Synopsis
    ```
    option-1 <argument>
    option-2 <argument>
    flag-3
    flag-4
    ...
    ```

- Snippets
    - Save in ~/Videos by default
        ```
        # Save in ~/Videos
        -o ~/Videos/%(title)s.%(ext)s
        ```

## Wiki

## Resources

## References
+ [Reddit - youtubedl - teachable hack](https://www.reddit.com/r/youtubedl/comments/105zhx1/teachable_hack/)
+ [Reddit - ytdlp FAQ and basic operations](https://old.reddit.com/user/krimsen/comments/uzpaaq/ytdlp_faq_and_basic_operation_tips_and_tricks/)
+ [Reddit - Not able to download from teachable](https://old.reddit.com/r/youtubedl/comments/v0h7su/not_able_to_download_from_teachable/iah7606/)
+ [ArchWiki - yt-dlp](https://wiki.archlinux.org/title/Yt-dlp)

## Remarks
