# vim - buffers

## Informations
```
In Computer Science/Programming/Software Development, Buffers are effectively temporary (memory) containers stored in the Random Access Memory (RAM) where you can write data into them for temporary storage for the application's lifetime
Using Buffer, one can manage the movement of data to and from the application and the device/hardware.

In Vim, buffers refers to the files that are opened. 
These files perform a one-time opening and are temporarily stored as buffers in the memory.
Therefore, the files could be in the foreground (Window), it could also be in the background, however, the temporary state of the files are stored in the memory and it wont affect the physical file itself as long as the user does not commit it by saving (:w)
```

## Documentations
### User commands
- ":badd [file-name]" : Add a new buffer for the specified file to the buffer list without opening the file
- ":ball"   : Open all the buffers present in the buffer list
- ":bdelete [file-name|buf-number{,last-buf-number}]" :Delete a buffer from the buffer list using the file name or buffer position number
- ":bfirst" : Jump to the first buffer in the buffer list; Related: [":brewind"]
- ":bnext"  : Edit the next buffer in the buffer list; Related: [":bn"]
- ":bprevious" : Edit the previous buffer in the buffer list; Related: [":bp", ":bNext"]
- ":blast"  : Open the last buffer in the buffer list
- ":sbfirst" : Jump to the first buffer in the buffer list in a new window; Related: [":sbrewind"]
- ":sbnext"  : To open the next buffer in the buffer list in a new windows
- ":sbprevious" : To open the previous buffer in the buffer list in a new window; Related: ["sbNext"]
- ":sblast" : To open the last buffer in the buffer list in a new window
- ":unhide" : To open all the loaded buffers in the buffer list; Each buffer will be loaded in a separate new window
- ":buffers" : To view the full list of buffers; Equivalent to ':files', ':ls'
    - Indicators
        + '%' : Marks the buffer of the currently active window
        + '#' : Marks the alternate/previous buffer
        + Column with line numbers: Indicates where the pointer is in the buffer
- ":close"   : Closes the active window; However, it gives a warning if you try to close the last window
- ":only"    : Focus on editing only a single buffer; Leaves only the active window and closest all other windows; Equivalent to the 'Ctrl+w+o' combination
- ":quit"    : Closes the active window and closest vim

## Wiki

## Resources

## References
+ [Baeldung - Linux - Working with Vim windows](https://www.baeldung.com/linux/vim-windows#:~:text=To%20open%20a%20split%20window,use%20Ctrl%2Bw%20%2Bn.)
+ [Linux Handbook - Vim Buffers](https://linuxhandbook.com/vim-buffers/)
+ [Vim Fandom - Vim Buffer](https://vim.fandom.com/wiki/Vim_buffer_FAQ#:~:text=How%20do%20I%20create%20a,or%20%3Anew%20or%20%3Avnew%20.)

## Remarks
