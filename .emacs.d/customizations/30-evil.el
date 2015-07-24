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

; https://github.com/bling/dotemacs/blob/061c06d18c29d09c7c87a8a1c83ac78a29f0ecb5/config/init-evil.el#L95
(unless (display-graphic-p)
  (evil-esc-mode))

(defun my-major-mode-evil-state-adjust ()
  (let ((evil-state-modes '(fundamental-mode
                            text-mode
                            prog-mode
                            sws-mode
                            dired-mode
                            comint-mode
                            log-edit-mode
                            compilation-mode))
        (emacs-state-modes '(debugger-mode
                             git-rebase-mode)))
    (when (apply 'derived-mode-p evil-state-modes)
      (turn-on-evil-mode))
    (when (apply 'derived-mode-p emacs-state-modes)
      (turn-off-evil-mode))))

(add-hook 'after-change-major-mode-hook #'my-major-mode-evil-state-adjust)

(cl-loop for mode in '(git-commit-mode magit-blame-mode)
         do (let ((hook (concat (symbol-name mode) "-hook")))
              (add-hook (intern hook) `(lambda ()
                                         (if ,mode
                                           (evil-emacs-state)
                                           (evil-normal-state))))))

(provide '30-evil)
