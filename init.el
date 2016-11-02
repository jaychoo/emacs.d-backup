(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar devpackages
  '(better-defaults
    ein
    elpy
    flycheck
    helm-core
    magit
    material-theme
    neotree
    projectile
    py-autopep8
    shell-pop))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      devpackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(require 'helm)
(require 'mouse)
(require 'neotree)
(require 'shell-pop)
(projectile-mode)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;; Global
(global-linum-mode t) ;; enable line numbers globally
(global-set-key [f5] 'shell-pop)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f7] 'toggle-comment-on-line) 

;; Python
(setq python-shell-virtualenv-path "~/.pyenv/versions/emacs")                        
(setq elpy-rpc-python-command "~/.pyenv/versions/emacs/bin/python") 
(elpy-enable)
(elpy-use-ipython)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; init.el ends here

(custom-set-variables
 '(shell-pop-window-size 30)
 '(shell-pop-window-position "bottom")
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck material-theme elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
