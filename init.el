(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar devpackages
  '(better-defaults
    auto-complete
    company
    ein
    elpy
    eldoc
    flycheck
    go-mode
    helm-core
    helm-projectile
    js2-mode
    magit
    material-theme
    monokai-theme
    neotree
    projectile
    py-autopep8
    pyvenv
    shell-pop
    smartparens
    swift-mode
    rust-mode
    racer
    cargo
    flycheck-rust
    dockerfile-mode))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      devpackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
;; (load-theme 'material t) ;; load material theme
(load-theme 'monokai t)
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

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
)

;; Global
(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%d ")
(setq column-number-mode t)

(global-set-key [f3] 'helm-projectile-grep)
(global-set-key [f4] 'helm-projectile)
(global-set-key [f5] 'shell-pop)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f7] 'toggle-comment-on-line) 
(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)
(electric-pair-mode 1)
(add-hook 'after-init-hook 'global-company-mode)

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

;; Golang
;;(require 'go-autocomplete)

;; JS
(setq javascript-indent-level 2) ; javascript-mode
(setq js-indent-level 2) ; js-mode
(setq js2-basic-offset 2) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
(setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
(setq web-mode-css-indent-offset 2) ; web-mode, css in html file
(setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
(setq css-indent-offset 2) ; css-mode

;; Rust
;; http://julienblanchard.com/2016/fancy-rust-development-with-emacs/
(require 'flycheck-rust)
(require 'racer)
(require 'rust-mode)

(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "/Users/jaychoo/Developer/rust/src") ;; Rust source code PATH
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'company-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
;; install rustformat - cargo install rustfmt
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)



;; init.el ends here

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
