(require 'init-elpa)
(require 'saveplace)
;;(require 'smartparens-config)

(require-package 'rainbow-delimiters)
(require-package 'flycheck)

(require-package 'evil)
(require 'evil)

;; Highliting matching parentheses
(show-paren-mode 1)
;; Matching opening parentheses/braces/quotes...
;; (smartparens-global-mode 1)

;;(sp-local-pair 'prog-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
;;(sp-local-pair 'prog-mode "(" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
;;(sp-local-pair 'prog-mode "[" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))

;;(defun my-create-newline-and-enter-sexp (&rest _ignored)
;;  (newline)
;;  (indent-according-to-mode)
;;  (forward-line -1)
;;  (indent-according-to-mode))

;; Highliting current line
(global-hl-line-mode 1)

;; Interactive search key bindings. By default, C-s runs isearch-forward, so this swaps the bindings
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; When you visit a place, point goes to the last place where it was
;; when you previously visited the same file.
(setq-default save-place t)
;; Storing last places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can create automatically backup files
;; This tells emacs to put them in ~/.emacs.d/backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(setq auto-save-default nil)

(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(evil-mode t)
(global-linum-mode t)

(provide 'init-editing)
