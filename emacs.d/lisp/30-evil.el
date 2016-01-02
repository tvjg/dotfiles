(use-package evil
  :ensure t
  :init
  (progn
    ;; Evil Leader mode has to be initialized before Evil mode to work
    ;; around a limitation.
    ;; https://github.com/cofi/evil-leader/issues/10
    (use-package evil-leader
      :ensure t
      :config
      (progn
        (setq evil-leader/in-all-states t)
        (evil-leader/set-leader ",")
        (global-evil-leader-mode t)

        (evil-leader/set-key
          "b" 'switch-to-buffer
          "f" 'find-file
          "," 'evil-repeat-find-char-reverse))))
  :config
  (progn
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))

    (setq evil-default-state 'emacs)
    (evil-mode)))

(use-package evil-surround
  :ensure t
  :requires 'evil
  :config (progn (global-evil-surround-mode t)))

(use-package evil-visualstar
  :ensure t
  :requires 'evil
  :config (progn (global-evil-visualstar-mode t)))

(use-package evil-commentary
  :ensure t
  :requires 'evil
  :diminish evil-commentary-mode
  :config (progn (evil-commentary-mode t)))

(use-package evil-matchit
  :ensure t
  :requires 'evil
  :config (progn (global-evil-matchit-mode t)))

(provide '30-evil)
