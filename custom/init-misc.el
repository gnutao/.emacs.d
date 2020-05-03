
;; hightlights the current cursor line
(global-hl-line-mode t)

;; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

;; deltes all the white space when hit backspace
;(use-package hungry-delete
;  :ensure t
;  :config
;  (global-hungry-delete-mode))

;; multiple cursons
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-c me") 'mc/edit-lines)
  (global-set-key (kbd "C-c mn") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c mp") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c ma") 'mc/mark-all-like-this))

;; expand the marked region
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-c r") 'er/expand-region))

;; smartparens
(use-package smartparens-config
  :ensure smartparens)

;; aggresive indent mode
; (use-package aggressive-indent
;  :ensure t)

;; mark and edit all copies
(use-package iedit
  :ensure t)

(provide 'init-misc)
