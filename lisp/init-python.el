;;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------
(require 'init-elpa)

(require-package 'better-defaults)
(require-package 'ein)
(require-package 'elpy)
(require-package 'flycheck)
(require-package 'py-autopep8)

(require 'better-defaults)
(require 'ein)
(require 'elpy)
(require 'flycheck)

(elpy-enable)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
;; init-python.el ends here
