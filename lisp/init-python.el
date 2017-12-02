(require 'py-autopep8)

(elpy-enable)

(pyvenv-activate "~/.pyenv/versions/emacs")
(setq exec-path (append exec-path '("~/.pyenv/versions/emacs/bin")))
(setq python-shell-virtualenv-path "~/.pyenv/versions/emacs")                        
(setq elpy-rpc-python-command "~/.pyenv/versions/emacs/bin/python")
(setq python-check-command (expand-file-name "~/.pyenv/versions/emacs/bin/flake8"))
(setq python-check-command "flake8")
(elpy-use-ipython)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
