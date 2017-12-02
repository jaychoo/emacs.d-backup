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
    cider
    clojure-mode
    ac-cider
    paredit
    ein
    elpy
    eldoc
    flycheck
    go-mode
    go-autocomplete
    flymake-go
    helm-core
    helm-projectile
    js2-mode
    magit
    dracula-theme
    monokai-theme
    neotree
    projectile
    py-autopep8
    pyvenv
    anaconda-mode
    shell-pop
    smartparens
    ;; swift-mode
    ;; rust-mode
    ;; racer
    ;; cargo
    ;; flycheck-rust
    dockerfile-mode))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      devpackages)

(provide 'init-package)
