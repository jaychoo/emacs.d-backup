;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-python)
(require 'init-javascript)
(require 'init-go)
(require 'init-local)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("28130127bbf3072c1bbc7652fca7245f186bb417b3b385a5e4da57b895ffe9d8" default)))
 '(package-selected-packages
   (quote
    (lua-mode flycheck material-theme elpy better-defaults)))
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
