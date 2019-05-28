;; set package sources
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; Initialize packages
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

;; Required by use-package
(use-package diminish)
(use-package bind-key)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)

;; Paradox Packages menu
;;(use-package paradox
;;	     :init
;;	     (setq paradox-execute-asynchronously t)
;;	     (setq paradox-github-token t)
;;	     (setq paradox-display-star-count nil)
;;
;;	     (defalias 'upgrade-packages #'paradox-upgrade-packages)
;;
;;	     ;; Replace default 'list-packages'
;;	     (defadvice list-packages (before my-list-packages activate)
;;	       (paradox-enable)))

(provide 'init-package)
