(use-package guide-key
  :ensure t
  :config
  (progn
    (setq guide-key/guide-key-sequence
          '("C-c"
            "C-h"
            "C-w"
            "C-u"
            "C-x"))
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)
    (guide-key-mode t)))

(provide '30-guide-key)
