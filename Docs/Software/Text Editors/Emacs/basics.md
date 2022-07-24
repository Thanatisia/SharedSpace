# Emacs basics

## Operators

## Keywords
+ require '[package-name] : To invoke a package
+ unless ([condition] '[package-name]) : Unless condition is met, invoke/install a package

### Headings
* : Top-level Heading
** : Heading-2

## Syntax
- To add ORG-Mode document
	```
	;; Import in the org-mode document to be a document file to run as the script
	;; using org-mode
    	(org-babel-load-file
     	    (expand-file-name
      	     "org-file-name.org"
      	     "path-to-file-name"))
	```
	- Keywords
		- Paths
			+ user-emacs-directory : Macro/Alias for 'emacs.d'

- Add repository to 'package.el'
	```
	#+begin_src emacs-lisp
		;; Import the library 'package'
		(require 'package)
		;; Add the repository to the package archives
		(add-to-list 'package-archives
			     '("[repository-name]" . "[repository-url]"))
		;; Refresh package lists after adding the repository
		(package-refresh-contents)
		;; Initialize the package list with the new packages
		(package-initialize)
	#+end_src
	```	

- To invoke a package
	```
	#+begin_src emacs-lisp
		(require '[package-name])
	#+end_src
	```

- To install a package
	+ use command 'use-package [package-name]'
	```
	#+begin_src emacs-lisp
		(use-package [package-name]
		    :ensure {t|f} ;; Install the package if not installed
		    :init	  ;; Tweak the package's configuration before loading it
		    (setq [configuration]) ;; Optional configurations and settings
		    (Other-actions))
	#+end_src
	```
	- Parameters
		+ :ensure {t|f} : To install the package if not installed
		+ :init		: To tweak the package's configurration before loading it
		+ :after {package-name} : Ensure the package runs after another package is found
		+ :config	: Configure

## ORG Mode

### Blocks
- To create a new block 
	+ #+[Block-keyword] [arguments]

- Block Keywords
	+ TITLE: [title] : Create a new title header
	+ AUTHOR: [author] : Create a new author header
	+ begin_src [language-of-source-code] : Create a new source code block
	+ end_src : End/Close the source code block

- To write a header
	+ #+[Header-text]: [text]
	```	
	To write a title at the header
	#+TITLE: [write title here]

	To write an author at the header
	#+AUTHOR: [write author here]
	```

- To start a source code block
	```
	#+begin_src [language-of-source-code]
		Your-code-here
	#+end_src
	```

### Source Code Block
- languages
	+ emacs-lisp
	+ bash


## Keybindings
+ Ctrl+X Ctrl+S : Save File

## Repositories

+ ALPA (should work out-of-the-box)
+ MELPA : https://melpa.org/packages/"

### Packages
+ evil : Evil Mode (vim keybinding) package
+ evil-collection : Programs that helps evil keybindings in other emacs programs
+ use-package : Used to import/handle packages
