;; Borrowed from https://rindrics.com/emacs/early-init/
;; Slashed start-up time in half

;;; early-init.el --- load before init.el

(custom-set-variables
 ;; Disable startup screen
 '(inhibit-startup-screen t)
 '(inhibit-startup-message t)
 '(inhibit-startup-echo-area-message t)
 '(initial-scratch-message nil)

 ;; Frame settings
 '(initial-frame-alist '((left-fringe . 0)
						 (right-fringe . 0)
						 (internal-border-width . 8)
						 (tool-bar-lines . 0)))

 ;; Disable UI elements
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)

 ;; Buffer settings
 '(initial-buffer-choice t)
 '(initial-major-mode 'fundamental-mode)

 ;; Frame behavior
 '(frame-inhibit-implied-resize t)
 '(frame-title-format nil)
 '(cursor-in-non-selected-windows nil)

 ;; Font settings
 '(font-lock-maximum-size nil)
 '(x-underline-at-descent-line t)

 ;; Window divider settings
 '(window-divider-default-right-width 16)
 '(window-divider-default-places 'right-only)

 ;; Performance settings
 '(gc-cons-threshold most-positive-fixnum))

;; For Emacs v29
(add-to-list 'default-frame-alist '(undecorated . t))

(setq package-enable-at-startup nil)

(provide 'early-init)
;;; early-init.el ends here
