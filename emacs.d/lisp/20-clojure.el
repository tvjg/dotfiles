(use-package clojure-mode
  :ensure t
  :config
  (progn
    (use-package cider :ensure t :pin melpa-stable)

    (use-package paredit
      :ensure t
      :config
      (progn
        (add-hook 'clojure-mode-hook 'paredit-mode)
        (add-hook 'cider-repl-mode-hook 'paredit-mode)))

    (use-package company
      :ensure t
      :config
      (progn
        (add-hook 'clojure-mode-hook 'company-mode)
        (add-hook 'cider-repl-mode-hook 'company-mode)))

    (use-package rainbow-delimiters
      :ensure t
      :config
      (progn
        (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
        (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)))

    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))))

(provide '20-clojure)
