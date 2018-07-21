(require 'init-elpa)
(require-package 'calmer-forest-theme)
(require-package 'golden-ratio)

(require 'golden-ratio)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil :height 150)
(setq-default line-spacing 0.3)

(setq
  x-select-enable-clipboard t
  x-select-enable-primary t
  save-interprogram-paste-before-kill t
  apropos-do-all t
  mouse-yank-at-point t)

(load-theme 'calmer-forest t)
(set-face-attribute 'default nil
                    :family "Overpass Mono Nerd Font"
                    :height 150
                    :weight 'normal
                    :width 'normal)

(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")
(setq ring-bell-function 'ignore)

(golden-ratio-mode 1)

(provide 'init-ui)

