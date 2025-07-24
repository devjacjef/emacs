;; Borrowed from https://rindrics.com/emacs/early-init/
;; Slashed start-up time in half

;;; early-init.el --- load before init.el

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; For Emacs v29
(add-to-list 'default-frame-alist '(undecorated . t))

(setq package-enable-at-startup nil)

(provide 'early-init)
;;; early-init.el ends here
