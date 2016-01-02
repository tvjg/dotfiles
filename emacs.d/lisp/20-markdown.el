(use-package markdown-mode
  :ensure t
  :config
  (progn
    (autoload 'markdown-mode "markdown-mode"
      "Major mode for editing Markdown files" t)

    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))))

(provide '20-markdown)
