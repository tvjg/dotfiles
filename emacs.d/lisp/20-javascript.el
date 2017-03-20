(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

    (setq js2-highlight-level 3)
    (setq js2-strict-missing-semi-warning nil)
    (setq js2-missing-semi-one-line-override nil)

    ;; Use plain old js-mode for JSON, js2-mode doth protest too much
    ;; https://github.com/bodil/emacs.d/blob/133386b9cc773377b36fce990d17367438a8916a/bodil/bodil-js.el#L38
    (add-to-list 'auto-mode-alist '("\\.json$" . js-mode))))

(provide '20-javascript)

