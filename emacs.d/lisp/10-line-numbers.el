(use-package nlinum-relative
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  :config
  (progn
    (line-number-mode t)
    (column-number-mode t)

    (nlinum-relative-setup-evil)
    (setq nlinum-relative-redisplay-delay 0.1)
    (setq nlinum-relative-current-symbol "0")))

(provide '10-line-numbers)
