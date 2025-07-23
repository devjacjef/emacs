;;; comp.el --- Configuration for completion

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
