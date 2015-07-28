;; Load up Org-babel
(require 'ob-tangle)

;; Load our main configuration file
(org-babel-load-file
  (expand-file-name "tvjg.org"
                    user-emacs-directory))
