# emacs config
Clone this repository to a location where these files will be kept.  Then, from
an emacs *scratch* buffer, type the following:
```html
        (expand-file-name "~/")
```
With the cursor still immediately after, input the keystroke command:
```html
        M-x eval-last-sexp
```
The minibuffer will now display your home path as it appears to emacs.  Navigate
to this path and rename the folder ".emacs.d/" to ".emacs.d.bak/" - it will no
longer be used.  Also, rename the file ".emacs" to ".emacs.bak" to save your
existing emacs preferences (which will be ignored).  Now, from a command prompt,
cd to the home path discovered earlier and enter the following:
```html
        mklink /j ".emacs.d" "<path-to-cloned-git>/.emacs.d/"
	mklink ".emacs" "<path-to-cloned-git>/.emacs"
```
Replace <path-to-cloned-git> with the actual path to these files.