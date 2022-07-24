# Things to do after installing

### Setup org-mode document for emacs config file

+ in 'emacs.d/init.el'
```
(org-babel-load-file
    (expand-file-name
     "config.org"
     user-emacs-directory))
```

### Setup package.el to work with MELPA

+ in 'config.org'
```
	#+begin_src emacs-lisp
		;; Import the library 'package'
		(require 'package)
		;; Add the repository to the package archives
		(add-to-list 'package-archives
			     '("melpa" . "https://melpa.org/packages/"))
		;; Refresh package lists after adding the repository
		(package-refresh-contents)
		;; Initialize the package list with the new packages
		(package-initialize)
	#+end_src
```

### Install use-package

```
	#+begin_src emacs-lisp
		(unless (package-installed-p 'use-package)
		    (package-install 'use-package))
	#+end_src
```

