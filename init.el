;; remove warning "package cl is deprecated" in emacs 27.1
(setq byte-compile-warnings '(cl-functions))

(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)

;; interface
(setq set-language-environment "UTF-8")
(setq inhibit-startup-message t)
(tool-bar-mode -1)

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

;; wgrep
(use-package wgrep
  :ensure t)

;; grep
;; (setq grep-command "grep --color --exclude-dir=obj --exclude-dir=obj.genconf -nHI -r /home/k3-user/K3_SYSTEM/package/k3system/source -e ")

;; default gdb command
(setq gud-gdb-command-name "arm-gdb -i=mi -x ~/kp3.dbg")

;; smex
(use-package smex
  :ensure t
  :config
  (smex-initialize))

;; undo tree
(use-package undo-tree
  :ensure t)

;; column-number-mode
(setq column-number-mode t)

;; compilation
(setq compilation-scroll-output t)
;; (setq compilation-scroll-output 'first-error)

(show-paren-mode)

;; my custome setup
(require 'init-ivy-mode)
(require 'init-cc-mode)
(require 'clang-rename)
(require 'init-eglot)
(require 'init-org-mode)
(require 'init-custom-theme)
(require 'init-misc)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide-leading-stars t)
 '(org-startup-folded t)
 '(org-startup-indented t)
 '(package-selected-packages
   '(cmake-mode magit which-key use-package try counsel ace-window)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
