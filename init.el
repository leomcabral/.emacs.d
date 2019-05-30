;; define load path
(defun update-load-path (&rest _)
  "Update `load-path'."
  (push (expand-file-name "configs" user-emacs-directory) load-path))

(advice-add #'package-initialize :after #'update-load-path)

(update-load-path)

;; Packages
(require 'init-package)

(require 'init-shell)

(require 'init-ui)

(require 'init-helm)
(require 'init-org)

(require 'init-evil)
(require 'init-programming)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 1)
 '(org-agenda-files (quote ("~/Dropbox/orgfiles/daitan-sym-appcentral.org")))
 '(package-selected-packages
   (quote
    (which-key org-bullets helm paradox diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
