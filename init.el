(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)

(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives 
	'("melpa" . "https://melpa.org/packages/") t)

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

;; my custome setup
(require 'init-cc-mode)
(require 'init-company)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (which-key use-package try counsel ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
