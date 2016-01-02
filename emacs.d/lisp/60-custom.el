;; Why type yes?
(fset 'yes-or-no-p 'y-or-n-p)

;; https://github.com/technomancy/better-defaults
(use-package better-defaults :ensure t)

;; diminish removes unneeded minor mode noise from the modeline
(use-package diminish :ensure t)

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))))

;; Moving cursor down at bottom scrolls only a single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)

;; Highlight current line
(global-hl-line-mode t)

;; Tmux causes issues with Ctrl+Arrows
;; use in combination with xterm-keys in .tmux.conf to restore desired behavior
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

;; Use `a` in dired to reuse buffer
(put 'dired-find-alternate-file 'disabled nil)

(provide '60-custom)
