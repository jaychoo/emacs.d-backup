(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar devpackages
  '(better-defaults
    auto-complete
    ein
    elpy
    flycheck
    helm-core
    helm-projectile
    magit
    material-theme
    neotree
    projectile
    py-autopep8
    shell-pop
    smartparens))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      devpackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(require 'helm)
(require 'helm-projectile)
(require 'mouse)
(require 'neotree)
(require 'shell-pop)
(require 'smartparens-config)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(ac-config-default)

;; Global
(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%d ")
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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck material-theme elpy better-defaults)))
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
