(require 'evil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)

(require 'evil-surround)
(global-evil-surround-mode 1)

; https://github.com/cofi/evil-leader/issues/1
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(setq evil-leader/leader ",")
(global-evil-leader-mode)
(evil-leader/set-key
  "b" 'switch-to-buffer
  "f" 'find-file
  "," 'evil-repeat-find-char-reverse)

;; evil only for modes that derive from prog-mode
;(add-hook 'prog-mode-hook 'evil-local-mode)
(evil-mode t)

(provide '30-evil)
