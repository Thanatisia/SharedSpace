# Media Conversion Handling

## Utilities
+ ffmpeg   : Powerful general media conversion CLI utility that is able to handle the conversion of various file types, as well as contains the ability for automatic detection of file type according to output file extension
- gifsicle : A GIF modification CLI utility, similar to ffmpeg but focused on GIF. 
    - Contains various useful functionalities such as 
        + '--scale [scale-factor]' : scaling the image's resolution (Width x Height) up and down proportional by a percentage
        + '--lossy [loss (0-100)]' : Compress the image according to how much image density you want the image to lose

## File Type Conversion
### Video to GIF
- Convert video to GIF
    - Using ffmpeg
        ```console
        ffmpeg [input-video-file] [output-gif-file].gif
        ```

## File Modification
### Scaling
- Scaling the image resolution of a GIF file to reduce file size
    - Using gifsicle
        - Scaling Down
            - Explanation
                + Shrinks the file from a larger resolution (i.e. 1920x1080) down by a scale factor (i.e. 0.5=1/2, 0.25=1/4) 
                + Useful for reducing file size, in exchange for image resolution
            ```console
            gifsicle --scale 0.X [input-gif-file] -o [output-gif-file]
            ```
        - Scaling Up
            - Explanation
                + Expands the file from a smaller resolution up by a scale factor (i.e. 1.0=100% increase, 2.0=200% increase, where X > 0, and Y is any value) 
            ```console
            gifsicle --scale X.Y [input-gif-file] -o [output-gif-file]
            ```

## Wiki

## Resources

## References

## Remarks