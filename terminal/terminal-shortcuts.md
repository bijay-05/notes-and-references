# Become more productive in the terminal

## Cursor movement

```markdown
CTRL + e   : move cursor to the end of line
CTRL + a   : move cursor to the start of line
Alt + b    : move back one word
Alt + f    : move forward one word
CTRl + xx  : toggle between cursor position and the beginning of the line
```

## Editing Shortcuts

```markdown
CTRL + u  : cut everything before the cursor
CTRL + k  : cut everything after the cursor
CTRL + w  : cut the word before the cursor
CTRL + y  : paste the last cut text
ALT + d   : delete the word after the cursor
CTRL + _  : undo the last edit
```

## History Shortcuts

```markdown
CTRL + r  : reverse search through command history
CTRL + g  : exit history search mode
!!        : execute the last command
!$        : use the last argument of the previous command
ALT + .   : Insert the last argument of the previous command ( can be pressed repeatedly to access earlier commands )
```

## Process Control Shortcuts

```markdown
CTRL + c  : interrupt (kill) the current foreground process
CTRL + z  : suspend the current foreground process
CTRL + d  : exit the current shell (similar to exit)
CTRL + l  : clear the screen (equivalent to clear command)
```

### Tools to look
- fzf
- tldr
- bat
- ripgrep (rg)
- fd