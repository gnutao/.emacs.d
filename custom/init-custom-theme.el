(use-package gruvbox-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t)

;; light theme
;; (use-package modus-operandi-theme
;;   :ensure t
;;   :init
;;   (setq modus-operandi-theme-visible-fringe t
;; 	modus-operandi-theme-slanted-constructs t
;; 	modus-operandi-theme-subtle-diff t
;; 	;;modus-operandi-theme-bold-constructs t
;; 	modus-operandi-theme-3d-modeline t))

;; ;; dark theme
;; (use-package modus-vivendi-theme
;;   :ensure t
;;   :init
;;   (setq modus-vivendi-theme-visible-fringe t
;; 	modus-vivendi-theme-slanted-constructs t
;; 	modus-vivendi-theme-subtle-diff t
;; 	;;modus-vivendi-theme-bold-constructs t
;; 	modus-vivendi-theme-3d-modeline t))

(setq custom-safe-themes t)
(load-theme 'gruvbox-dark-hard t)

(provide 'init-custom-theme)
