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

;; reveil.js
(use-package ox-reveal
  :ensure t
  :config
  (require 'ox-reveal)
  (setq org-reveal-root "file:///home/k3-user/fixhd/.emacs.d/reveal.js/")
  (setq org-reveal-mathjax t))

(use-package htmlize
  :ensure t)

(provide 'init-org-mode)
