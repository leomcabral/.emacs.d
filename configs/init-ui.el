(use-package zenburn-theme
  :init
  (load-theme 'zenburn t))

(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Set emacs frame size
(setq initial-frame-alist '((width . 180) (height . 60)))

(provide 'init-ui)
