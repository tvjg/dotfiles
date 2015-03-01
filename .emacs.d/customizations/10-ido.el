;; Basic ido w/ flex matching is already enabled by better-defaults
;; package
(require 'flx-ido)

(ido-everywhere 1)
(flx-ido-mode 1)

(setq ido-enable-flex-matching t)

(provide '10-ido)
