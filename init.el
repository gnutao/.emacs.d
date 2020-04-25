(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)
(setq set-language-environment "UTF-8")

(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives 
	'("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	'("gnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
  
(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

;; try
(use-package try
	:ensure t)
	
;; which key
(use-package which-key
	:ensure t 
	:config
	(which-key-mode))
	
;; ace window
(use-package ace-window
  :ensure t
  :init
  (progn
  (setq aw-scope 'global) ;; was frame
  (global-set-key (kbd "C-x O") 'other-frame)
    (global-set-key [remap other-window] 'ace-window)))
	
;; ivy, councile, swiper
(use-package counsel
	:ensure t
	:bind
	(("M-y" . counsel-yank-pop)
	:map ivy-minibuffer-map
	("M-y" . ivy-next-line)))
	
(use-package ivy
	:ensure t
	:diminish (ivy-mode)
	:bind (("C-x b" . ivy-switch-buffer))
	:config
	(ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq ivy-count-format "%d/%d ")
	(setq ivy-display-style 'fancy))
	
(use-package swiper
	:ensure t
	:bind (("C-s" . swiper-isearch)
	;;("C-r" . swiper-isearch)
	("C-c C-r" . ivy-resume)
	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file))
	:config
	(progn
	(ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq ivy-display-style 'fancy)
	(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))
	
;; avy
(use-package avy
	:ensure t
	:bind ("M-s" . avy-goto-word-1))

;; grep
(setq grep-command "grep --color --exclude-dir=obj -nHI -r /home/k3-user/K3_SYSTEM/package/k3system/source -e ")

;; smex
(use-package smex
  :ensure t
  :config
  (smex-initialize))

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"
	  "~/.emacs.d/elpa/yasnippet-snippets-20200314.1030/snippets"))
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all)
  (yas-global-mode 1))

;; magit
(use-package magit
  :ensure t)

;; my custome setup
(require 'init-cc-mode)
(require 'init-company)
(require 'init-org-mode)
(require 'init-custom-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (gruvbox-dark-hard)))
 '(custom-safe-themes
   (quote
    ("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-hide-leading-stars t)
 '(org-startup-folded t)
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (magit irony which-key use-package try counsel ace-window)))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
