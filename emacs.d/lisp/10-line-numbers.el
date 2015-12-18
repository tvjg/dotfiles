(global-relative-line-numbers-mode t)
(line-number-mode t)
(column-number-mode t)

(setq relative-line-numbers-format #'padded-line-numbers)

(defun padded-line-numbers (offset)
  (format "%2d " (abs offset)))

(provide '10-line-numbers)
