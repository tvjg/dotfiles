; Why type yes?
(fset 'yes-or-no-p 'y-or-n-p)

; Moving cursor down at bottom scrolls only a single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)

; Tmux causes issues with Ctrl+Arrows
; use in combination with xterm-keys in .tmux.conf to restore desired behavior
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(setq make-backup-files nil)
 '(cider-switch-to-repl-command (quote clojure-quick-repls-switch-to-relevant-repl))
 '(clojure-quick-repls-cljs-setup
   "(require 'weasel.repl.websocket)
       (cemerick.piggieback/cljs-repl
                    :repl-env (weasel.repl.websocket/repl-env :port 9001))")
 '(nrepl-sync-request-timeout 60)
 '(tramp-auto-save-directory "~/.emacs.d/tramp-autosave"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

(provide '60-custom)
