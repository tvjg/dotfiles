;; (use-package cyberpunk-theme :ensure t)

(use-package base16-theme
  :ensure t
  :init 
  :config
  (progn
    (setq base16-theme-256-color-source "base16-shell")
    (load-theme 'base16-ocean t)))

(provide '10-color)
