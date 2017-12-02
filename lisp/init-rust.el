;; http://julienblanchard.com/2016/fancy-rust-development-with-emacs/

;; (require 'flycheck-rust)
;; (require 'racer)
;; (require 'rust-mode)

;; (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
;; (setq racer-rust-src-path "/Users/jaychoo/Developer/rust/src") ;; Rust source code PATH
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'rust-mode-hook #'company-mode)
;; (add-hook 'rust-mode-hook 'cargo-minor-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)

;; install rustformat - cargo install rustfmt
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

(provide 'init-rust)
