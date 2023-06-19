# SpotDL

## Information
- SpotDL is a Spotify playlist and songs finder and a YouTube music downloader if a match is found,
    + that finds songs from Spotify playlists on YouTube and downloads them - along with album art, lyrics and metadata.

### Package Information
+ Author: spotDL
+ Repository Name: spotify-downloader
+ Repository URL: https://github.com/spotDL/spotify-downloader
+ Docker Image: spotdl/spotify-downloader

### Project Filesystem Structure
- Configuration Files
    + Windows: "C:\Users\[username]\.spotdl\config.json"
    + User-specific configuration file: ~/.spotdl/config.json
    - Supports '$XDG_DATA_HOME'
        - Pre-Requisites
            + Run `mkdir $XDG_DATA_HOME/spotdl`, next time you run spotdl, it will be automatically used

## Setup
### Dependencies
+ python 3.7+
+ git
+ ffmpeg (binary)

### Pre-Requisites
- Obtaining Source code
    - Using git
        ```console
        git clone https://github.com/spotDL/spotify-downloader
        ```
    - Change directory
        ```console
        cd spotify-downloader
        ```

- Update PyPI (pip) to latest version
    ```console
    python3 -m pip install --upgrade pip
    ```

- Install essential python packages
    + setuptools
    + wheel
    + poetry
    ```console
    python3 -m pip install --upgrade setuptools wheel poetry
    ```

- (Optional) Installing ffmpeg
    - Reasoning
        + ffmpeg is required for SpotDL
    - If you are using ffmpeg only for SpotDL
        + You can simply install ffmpeg to your SpotDL installation directory
            ```console
            spotdl --download-ffmpeg
            ```
    - Installing ffmpeg system-wide
        - Windows
            + Download the ffmpeg release from their site
            + Add the binary into your system '%PATH%' environment variable
        - OSX
            ```console
            brew install ffmpeg
            ```
        - Linux
            - Using package manager
                - apt
                    ```console
                    sudo apt install ffmpeg
                    ```
                - pacman
                    ```console
                    sudo pacman -S ffmpeg
                    ```

### Installation
- (Recommended) Using pip
    - From PyPI
        + The stable releases of spotDL are distributed on PyPI and can be easily installed or upgraded using pip
            ```console
            python3 -m pip install -U spotdl
            ```

- On Termux
    - Notes
        + Please remember to read the shellscript before executing it, always
    ```console
    curl -L https://raw.githubusercontent.com/spotDL/spotify-downloader/master/scripts/termux.sh | sh
    ```

- Compile and build from source
    + If you are manually building the package from source
    - Run poetry builder
        ```console
        poetry install
        ```

    - Build executable of python script
        + An exectuable will be created in 'spotify-downloader/dist/'
        ```console
        python3 scripts/build.py
        ```

### Update
- Using pip(3)
    ```console
    pip{3} install --upgrade spotdl
    ```

### Docker
> SpotDL has a docker image
- Build Image
    ```console
    docker build -t spotdl .
    ```
- Launch container with spotDL parameters
    - Notes
        + You need to create mapped volumes to access the song files
    ```console
    docker run --rm -v $(pwd):/music spotdl download [trackUrl]
    ```
- Docker-compose
    - compose file
        ```yaml
        version: "3.5"
        services:
            spotdl:
                image: spotdl
                container_name: spotdl
                volumes:
                    # Mount the paths from host system volume to container volume
                    # - [Host system volume]:[container volume]:[permission]
                    - "./spotdl/music:/music"
                command: spotdl download [trackUrl]
        ```

## Documentation
### Synopsis/Syntax
- Run without options
    ```console
    spotdl [urls]
    ```
- Run as a package
    ```console
    python{3} -m spotdl [urls]
    ```
- General Usage
    ```console
    spotdl [operation] {options} <arguments> [QUERY|URLs]
    ```

### Parameters
> This list is incomplete; Please refer to the help/manual/documentations for a full list of options
- Positionals
    - operation : The action/operation/tasks to execute using spotDL
        + Type: Action String
        - Valid Actions
            + download  : Simply downloads the songs from YouTube and embeds metadata (Default)
            + meta      : Updates metadata for the provided song file
            + save      : Saves only the metadata from Spotify without downloading anything
            + sync      : Updates directories. Compares the directory with the current state of the playlist. Newly added songs will be downloaded and removed songs will be deleted. No other songs will be downloaded and no other files will be deleted.
            + url       : Get direct download link for each song from the query
            + web       : Starts a web interface instead of using the command line. This has limited features and only supports downloading single songs
    - query : The values you want to parse into the operation; Usually is a list of Spotify URLs, but for some operations like `sync`, only a single link or file is required.
        + Type: List<URL strings> | link | file
        - Valid Queries
            + [List of spotify URLs]
            + link
            + file
- Optionals
    - With Arguments
        - Audio Options
            - --bitrate {bitrate} : Convert the file to the specified bitrate
                - Special Options
                    + disable : To skip the conversion step for certain file formats such as M4A/OPUS
        - General Options
            + --save-file {file-name}.spotdl : Output the saved data into the specified output file
            + --output [output-filepath] : Explicitly specify the output path of the downloads
        - WebUI options
            + --web-use-output-dir : Make the output directory of the WebUI downloads to follow '--output'; By default, the webUI will download the files to a special directory '/music'
    - Flags
        - General Options
            + -h | --help   : Display help and all options
            + --version     : Display program version and exit

### Usage
- Download 
    - Song
        ```console
        spotdl download [trackURL]
        ```
    - Album
        ```console
        spotdl download [albumURL]
        ```
    - Artist
        ```console
        spotdl download [artistURL]
        ```
    - Playlist
        ```console
        spotdl download [playlistURL]
        ```
    - Search
        ```console
        spotdl download [songQuery]
        ```
    - YouTube Link with Spotify metadata
        ```console
        spotdl download "YouTubeURL|SpotifyURL"
        ```

- Queue multiple download tasks
    - By separating the arguments with spaces
        + Order does not matter
    ```console
    spotdl download [songQuery1] [albumURL] [songQuery2] ...
    ```

- Save only the metadata from Spotify without downloading anything 
    ```console
    spotdl save [query] --save-file {filename}.spotdl
    ```

- Get direct download link for each song from the query
    ```console
    spotdl url [query]
    ```

- Synchronize the directory with the current state of the playlist with the state of the spotify account
    + Synchronize and create a new sync file
        ```console
        spotdl sync [query] --save-file {filename}.spotdl
        ```
    + Synchronize and update the directory in the future
        ```console
        spotdl sync {filename}.spotdl
        ```

### Snippets and Examples
- Download 
    - Song
        ```console
        spotdl download "https://open.spotify.com/track/[song-ID]"
        ```
    - Album
        ```console
        spotdl download "https://open.spotify.com/album/[album-ID]"
        ```
    - Artist
        ```console
        spotdl download "https://open.spotify.com/artist/[artist-ID]"
        ```
    - Playlist
        ```console
        spotdl download "https://open.spotify.com/playlist/[playlist-ID]
        ```
    - Search
        ```console
        spotdl download 'Song Title Here'
        ```
    - YouTube Link with Spotify metadata
        ```console
        spotdl download "https://www.youtube.com/watch?v=[video-ID]|https://open.spotify.com/track/[song-ID]"
        ```

- Queue multiple download tasks
    ```console
    spotdl download 'Name of Song' https://open.spotify.com/playlist/[playlist-id] ...
    ```

### Configuration
- Generate a config file
    - Notes
        + This will overwrite the existing config file
    ```console
    spotdl --generate-config
    ```
- Loading configurations
    - Config file will get loaded automatically if it already exists, or 
        + if you have passed the `--config` flag
    - To remove loading configuration automatically
        + Change the 'load_config' option in config file to false
        ```json
        {
            ...
            "load_config": false
            ...
        }
        ```

- Structure
    + the Configuration file is in JSON


- Syntax/Synopsis
    ```
    {
        "key" : integer-value,
        "key" : "string-value",
        "key" : null,
        "key" : true|false,
        "key" : [
            "list",
            "elements"
        ]
    }
    ```

- Default Configuration
    ```json
{
    "client_id": "5f573c9620494bae87890c0f08a60293",
    "client_secret": "212476d9b0f3472eaa762d90b19b0ba8",
    "auth_token": null,
    "user_auth": false,
    "headless": false,
    "cache_path": "/Users/username/.spotdl/.spotipy",
    "no_cache": false,
    "max_retries": 3,
    "audio_providers": [
        "youtube-music"
    ],
    "lyrics_providers": [
        "genius",
        "azlyrics",
        "musixmatch"
    ],
    "playlist_numbering": false,
    "scan_for_songs": false,
    "m3u": null,
    "output": "{artists} - {title}.{output-ext}",
    "overwrite": "skip",
    "search_query": null,
    "ffmpeg": "ffmpeg",
    "bitrate": null,
    "ffmpeg_args": null,
    "format": "mp3",
    "save_file": null,
    "filter_results": true,
    "threads": 4,
    "cookie_file": null,
    "restrict": false,
    "print_errors": false,
    "sponsor_block": false,
    "preload": false,
    "archive": null,
    "load_config": true,
    "log_level": "INFO",
    "simple_tui": false,
    "fetch_albums": false,
    "id3_separator": "/",
    "ytm_data": false,
    "add_unavailable": false,
    "generate_lrc": false,
    "force_update_metadata": false,
    "web_use_output_dir": false,
    "port": 8800,
    "host": "localhost",
    "keep_alive": false,
    "allowed_origins": null,
    "keep_sessions": false,
    "only_verified_results": false
}
    ```

- 'output' key
    + These key variables will format certain aspect of the song/music that will be output
    - Variables
        > Variable	        Explanation	                            Example
        + {title}	        Song title	                            Dark Horse
        + {artists}	        Song artists	                        Katy Perry, Juicy J
        + {artist}	        Primary artist	                        Katy Perry
        + {album}	        Album name	                            PRISM
        + {album-artist}	Primary artist of the album	            Katy Perry
        + {genre}	        Genre	                                dance pop
        + {disc-number}	    Useful for multi-disc releases	        1
        + {disc-count}	    Total number of discs in the album	    1
        + {duration}	    Duration of the song in seconds	        215.672
        + {year}	        Year of release	                        2013
        + {original-date}	Date of original release	            2013-01-01
        + {track-number}	Track number in the album	            06
        + {tracks-count}	Total number of tracks in the album	    13
        + {isrc}	        International Standard Recording Code	USUM71311296
        + {track-id}	    Spotify song ID	                        4jbmgIyjGoXjY01XxatOx6
        + {publisher}	    Record label	                        Capitol Records (CAP)
        + {list-length}	    Number of items in a playlist	        10
        + {list-position}	Position of the song in a playlist	    1
        + {list-name}	    Name of the playlist	                Saved
        + {output-ext}	    File extension	                        mp3

- Snippets


## Wiki

## Resources
+ [SpotDL installation](https://spotdl.readthedocs.io/en/latest/installation/)
+ [SpotDL usage](https://spotdl.github.io/spotify-downloader/usage/)

## References
+ [Releases](https://github.com/spotDL/spotify-downloader/releases)
+ [AUR package - SpotDL](https://aur.archlinux.org/packages/python-spotdl/)

## Remarks
