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
  (("C-s" . swiper-isearch)
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
(global-set-key (kbd "C-c m g") 'counsel-git)
(global-set-key (kbd "C-c m j") 'counsel-git-grep)
(global-set-key (kbd "C-c m i") 'counsel-imenu)
(global-set-key (kbd "C-c m k") 'counsel-ag)
(global-set-key (kbd "C-c m l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(provide 'init-ivy-mode)
