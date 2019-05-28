;; Helm init/config
(use-package helm
  :config
  (helm-mode 1))

(use-package helm-ag)
(use-package helm-descbinds)
(use-package helm-mode-manager)
(use-package helm-themes)

;; Global-map
(global-set-key (kbd "M-x") 'undefined)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key global-map [remap list-buffers] 'helm-mini)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)

;; which-key
(use-package which-key)
(which-key-mode)

(provide 'init-helm)
