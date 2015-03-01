(require 'guide-key)
(setq guide-key/guide-key-sequence
      '(
        "C-c"
        "C-h"
        "C-w"
        "C-x"
        ))
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)  ; Enable guide-key-mode

(provide '30-guide-key)
