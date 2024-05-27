# Vim Buffer Events for Autocommands

## Information
### Description
- In vim, Buffer Events are essentially activities that occur during the lifetime/runtime of the buffer
    + Every transitional phase between point-to-points are known as 'Events'
    + These events can be used by users to setup autocommands at specific time periods/events.
+ Autocommands are, as the name suggests, commands that are executed/triggered/activated when the target file types/extensions (aka 'patterns') are detected during the expected buffer event/time periods

## Events
+ BufEnter : When the file is opened and entering the buffer
+ BufWinEnter : When the file is opened and entering the vim editor window

