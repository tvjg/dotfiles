(use-package tramp
  :init
  (progn
    ;; http://emacs.stackexchange.com/questions/18438/emacs-suspend-at-startup-ssh-connection-issue
    (setq tramp-ssh-controlmaster-options
          "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

    ;; Keep tramp files out of the way
    (setq tramp-auto-save-directory
          (expand-file-name "tramp-autosave/" tvjg/ephemeral-directory)))
  :config
  (progn
    (setq tramp-default-method "ssh")))

(provide '10-tramp)
