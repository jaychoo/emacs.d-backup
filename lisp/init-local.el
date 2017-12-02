(require 'helm)
(require 'helm-projectile)
(require 'mouse)
(require 'neotree)
(require 'shell-pop)
(require 'smartparens-config)

(setenv
 "PATH" (concat
   "/bin:"
   "/usr/bin:"
   "/sbin:"
   "/usr/sbin:"
   "/usr/local/bin:"
   "/usr/local/sbin"
   "~/.local/bin"
   "~/.pyenv/versions/emacs/bin"))

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'dracula t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(ac-config-default)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
)

(global-linum-mode t) ;; enable line numbers globally
;; (setq linum-format "%d ")
(setq column-number-mode t)

(global-set-key [f2] 'neotree-toggle)
(global-set-key [f3] 'helm-projectile-grep)
(global-set-key [f4] 'helm-projectile)
(global-set-key [f5] 'shell-pop)
(global-set-key [f7] 'toggle-comment-on-line) 

(global-auto-complete-mode t)

(setq ac-auto-start 2)
(setq ac-ignore-case nil)
(electric-pair-mode 1)
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("28130127bbf3072c1bbc7652fca7245f186bb417b3b385a5e4da57b895ffe9d8" default)))
 '(package-selected-packages (quote (flycheck material-theme elpy better-defaults)))
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init-local)
