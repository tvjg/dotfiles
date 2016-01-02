(use-package emmet-mode
  :ensure t
  :config
  (progn
    (add-hook 'sgml-mode-hook 'emmet-mode)   ;; Auto-start on any markup modes
    (add-hook 'css-mode-hook  'emmet-mode))) ;; Enable Emmet's css abbreviation

(provide '10-emmet)
