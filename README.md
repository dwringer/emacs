# emacs config
Clone this repository to a location where these files will be kept.
Then, from emacs, press `<M-:>` and then at the minibuffer prompt enter:
```html
        (expand-file-name "~/")
```
Afterwards, press `<Return>` and the minibuffer will now display your
home path as it appears to emacs.  Navigate to this path and rename
the folder ".emacs.d/" to ".emacs.d.bak/" - it will no longer be used.
Also, rename the file ".emacs" to ".emacs.bak" to save your existing
emacs preferences (which will be ignored).  Now, from a command
prompt, cd to the home path discovered earlier and enter the
following:
```html
        mklink /j ".emacs.d" "<path-to-cloned-git>/.emacs.d/"
        mklink ".emacs" "<path-to-cloned-git>/.emacs"
```
Replace <path-to-cloned-git> with the actual path to these files.