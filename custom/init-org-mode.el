(use-package org
  :ensure t)

; org bullets
; (use-package org-bullets
;   :ensure t
;   :config
;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-startup-folded t)
 '(org-hide-leading-stars t)
 '(org-startup-indented t))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org-mode)
