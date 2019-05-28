(use-package org
  :ensure nil
  :commands org-try-structure-completion
  :functions hydra-org-template/body
  :custom-face
  :bind (("C-c a" . org-agenda)
	 ("C-c b" . org-switchb)
	 ("C-c c" . org-capture))
  :hook (org-indent-mode . (lambda() (diminish 'org-indent-mode)))
  :config
  (setq org-log-done 'time
	org-pretty-entities t
	org-agenda-files (list "~/Dropbox/orgfiles/daitan-sym-appcentral.org"
			       "~/Dropbox/orgfiles/personal.org")
	org-capture-templates '(("t" "Todo" entry (file+headline "~/Dropbox/orgfiles/personal.org" "Tasks")
				 "* TODO %?\n %i\n %a")

		
				("a" "Todo AppCentral" entry (file+headline "~/Dropbox/orgfiles/daitan-sym-appcentral.org" "Tasks")
				 "* TODO %?\n %i\n %a")))

  (use-package org-bullets
    :hook (org-mode . org-bullets-mode))
  
  ;; Prettify UI
  (add-hook 'org-mode-hook
            (lambda ()
              "Beautify Org Checkbox Symbol"
              (push '("[ ]" . "☐") prettify-symbols-alist)
              (push '("[X]" . "☑") prettify-symbols-alist)
              (push '("[-]" . "❍") prettify-symbols-alist)
              (push '("#+BEGIN_SRC" . "λ") prettify-symbols-alist)
              (push '("#+END_SRC" . "λ") prettify-symbols-alist)
              (prettify-symbols-mode))))


(provide 'init-org)
