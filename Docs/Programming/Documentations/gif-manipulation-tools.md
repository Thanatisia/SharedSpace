# Tools - GIF Creation, Encoding and Manipulation

## Tools
+ ffmpeg : Media CLI utility that is able to convert videos into GIF animation files
+ gifski : GIF Encoder (used by asciinema-agg) that converts external formats into GIF animation files
+ gifsicle : Used for encoding/manipulating GIF files (i.e. quality, size etc etc)

## Shrinking/Compressing GIF

> Using gifsicle

- Tweak lossiness level and colour level of GIF
    ```bash
    gifsicle --lossy=80 -k 128 -O2 -Okeep-empty [target-input-gif] -o [output-formatted-gif]
    ```

## Resources

## References
+ [Asciinema docs - agg - Usage](https://docs.asciinema.org/manual/agg/usage/)

## Remarks

