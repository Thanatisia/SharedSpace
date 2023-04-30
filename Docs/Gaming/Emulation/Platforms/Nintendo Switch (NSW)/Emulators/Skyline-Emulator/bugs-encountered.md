# Skyline Emulator - Bugs and Issues Encountered

```
Compilation of some bugs and issues encountered and the explanations
```

## FAQ
- In-Game FMV cutscenes leads to black screen
    - As of [2023-04-28 0114H - #2498](https://github.com/skyline-emu/skyline/commit/24d4f5e3cd12a1a54b2ac7d38aecb16a31dbcf89)
        - Skyline does not have nvdec support yet 
            + nvdec handles video rendering in the emulator
            + Thus, all FMV, movie and anime style cutscenes do not work on skyline


