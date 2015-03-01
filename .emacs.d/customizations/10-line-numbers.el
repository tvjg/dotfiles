(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

(setq relative-line-numbers-format #'padded-line-numbers)

(defun padded-line-numbers (offset)
  (format "%2d " (abs offset)))

(provide '10-line-numbers)
