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

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)
