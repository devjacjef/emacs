;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Line Numbers
(global-display-line-numbers-mode)

;; Automatic Pairs
(electric-pair-mode t)

;; Enabling MELPA
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

; Loading external files
(load-file (expand-file-name "comp.el" user-emacs-directory))
(load-file (expand-file-name "evil.el" user-emacs-directory))
(load-file (expand-file-name "tools.el" user-emacs-directory))

