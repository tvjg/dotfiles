;; Basic ido w/ flex matching is already enabled by better-defaults
;; package
(use-package flx-ido
  :ensure t
  :init
  (progn
    (setq ido-save-directory-list-file (expand-file-name "ido.last" tvjg/ephemeral-directory)))
  :config
  (progn
    (ido-everywhere t)
    (flx-ido-mode t)

    (setq ido-enable-flex-matching t)
    (add-to-list 'ido-ignore-files "\\.DS_Store")))

(provide '10-ido)
