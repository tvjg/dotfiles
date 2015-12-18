(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(mapc 'load (directory-files "~/.emacs.d/customizations" t "^[0-9]+.*\.el$"))

(provide 'init)
