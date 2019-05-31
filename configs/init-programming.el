;; Generic dependencies
(use-package paredit
  :ensure t)
(use-package ido-completing-read+)
(use-package rainbow-delimiters)
(use-package projectile
  :ensure t
  :config
  (setq projectile-completion-system 'ivy
	projectile-project-search-path '("~/Dev"))

  ;;keybindings
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))
(projectile-mode +1)
(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))
(use-package magit)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(show-paren-mode 1)

;; Remove trailing whitespaces on save
(defun my-remove-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'my-remove-trailing-whitespace)

;;
;; elisp
;;
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook ' turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; end - elisp

;;
;;Clojure and Cider
;;
(use-package clojure-mode-extra-font-locking)
(use-package clojure-mode
  :config

  ;; enable paredit for Clojure
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)

  ;; useful for working with camel-case tokens, like
  ;; names of Java classes (e.g. JavaClassName)
  (add-hook 'clojure-mode-hook 'subword-mode)

  ;; more syntax highlighting
  (require 'clojure-mode-extra-font-locking)

  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'clojure-mode-hook
	    (lambda ()
	      (setq inferior-lisp-program "lein repl")
	      (rainbow-delimiters-mode)))

  ;;use clojure mode for other extensions
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode)))

(use-package cider
  :config
  (add-hook 'cider-mode-hook 'turn-on-eldoc-mode)
  (setq cider-repl-pop-to-buffer-on-connect t
	cider-show-error-buffer t
	cider-auto-select-error-buffer t
	cider-repl-history-file "~/.emacs.d/cider-history"
	cider-repl-wrap-history t)
  (add-hook 'cider-repl-mode-hook 'paredit-mode))


;; end - Clojure and Cider

(provide 'init-programming)
