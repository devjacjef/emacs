;; Getting rid of extra UI elements
(setq inhibit-splash-screen t)
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'tool-bar-mode nil)
(customize-set-variable 'menu-bar-mode nil)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Line Numbers
(global-display-line-numbers-mode)

;; Automatic Pairs
(electric-pair-mode t)

;; Enabling MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; TODO: Split into multiple files..

;; Vim Bindings
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; Vim Bindings across Emacs
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

;; LSP Support
(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)
	 (php-mode . lsp)
	 (web-mode . lsp)))

(use-package lsp-ui
  :ensure t
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-show-with-cursor t))

;; Snippets
(use-package yasnippet
  :ensure t
  :hook (prog-mode . yas-minor-mode))

;; Auto Complete
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 2
	company-tooltip-limit 8
	company-dabbrev-downcase 0)
  :hook (after-init . global-company-mode))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

;; Web Programming
(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode))
  :hook (web-mode . lsp))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)
                        (agenda    . 5)
                        (registers . 5)))
  (setq dashboard-projects-backend 'projectile))

;; TODO, make more use of treemacs
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     default))
 '(package-selected-packages
   '(company-box dashboard evil-collection gruvbox-theme lsp-ui magit
		 projectile treemacs treemacs-evil web-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
