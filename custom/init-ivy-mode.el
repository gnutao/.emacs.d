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
  :bind
  ;; (("C-s" . swiper-isearch)
  ;; (("C-s" . counsel-grep-or-swiper)
  (("C-s" . swiper)
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

(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> j") 'counsel-set-variable)
(global-set-key (kbd "C-c i a") 'counsel-ag)
(global-set-key (kbd "C-c i b") 'counsel-switch-buffer)
(global-set-key (kbd "C-c i c") 'counsel-compile)
(global-set-key (kbd "C-c i d") 'counsel-dired)
(global-set-key (kbd "C-c i e") 'counsel-load-theme)
(global-set-key (kbd "C-c i f") 'counsel-describe-function)
(global-set-key (kbd "C-c i g") 'counsel-git)
(global-set-key (kbd "C-c i i") 'counsel-imenu)
(global-set-key (kbd "C-c i j") 'counsel-git-grep)
(global-set-key (kbd "C-c i l") 'counsel-locate)
(global-set-key (kbd "C-c i m") 'counsel-mark-ring)
(global-set-key (kbd "C-c i o") 'ivy-occur)
(global-set-key (kbd "C-c i p") 'counsel-pt)
(global-set-key (kbd "C-c i r") 'counsel-rg)
(global-set-key (kbd "C-c i s") 'counsel-set-variable)
(global-set-key (kbd "C-c i t") 'swiper-thing-at-point)
(global-set-key (kbd "C-c i v") 'counsel-describe-variable)
(global-set-key (kbd "C-c i w") 'ivy-switch-view)
(global-set-key (kbd "C-c i x") 'ivy-push-view)
(global-set-key (kbd "C-c i y") 'ivy-pop-view)
(global-set-key (kbd "C-c i z") 'counsel-fzf)

(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(provide 'init-ivy-mode)
