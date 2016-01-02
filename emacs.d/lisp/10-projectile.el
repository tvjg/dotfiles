(use-package projectile
  :ensure t
  :config
  (progn
    (add-to-list 'projectile-globally-ignored-files ".DS_Store") ;; FIXME: Only works for file in root
    (projectile-global-mode)))

(provide '10-projectile)
