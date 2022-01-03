;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))

(with-eval-after-load 'yasnippet
  (add-hook 'prog-mode-hook 'yas-minor-mode))

;; company
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1)
  (setq company-show-numbers t)
  (setq company-elisp-detect-function-context nil)
  (setq company-minimum-prefix-length 2)
  (setq company-backends (cons 'company-capf (remove 'company-capf company-backends))))

(with-eval-after-load 'company
  (add-hook 'c-mode-common-hook 'company-mode))

;; projectile
(use-package projectile
  :ensure t
  :demand t
  :bind ("C-c p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy
        projectile-globally-ignored-file-suffixes '("#" "~" ".o" ".so" ".elc" ".pyc")
	projectile-globally-ignored-directories '(".git" ".project" ".ccls-cache" ".clangd" ".launches")
	projectile-track-known-projects-automatically nil)
  (projectile-mode +1))

(defun my-projectile-project-find-function (dir)
    (let ((root (projectile-project-root dir)))
      (and root (cons 'transient root))))

(with-eval-after-load 'project
    (add-to-list 'project-find-functions 'my-projectile-project-find-function))

;; eglot for lsp
(use-package eglot
  :ensure t
  :config
  (setq eglot-confirm-server-initiated-edits t))

;; c/c++ server
(add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--header-insertion=never")))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; bash server
(add-to-list 'eglot-server-programs '(sh-mode . ("bash-language-server" "start")))
(add-hook 'sh-mode-hook 'eglot-ensure)


(define-key eglot-mode-map (kbd "C-c e c") 'eglot-reconnect)
(define-key eglot-mode-map (kbd "C-c e r") 'eglot-rename)
(define-key eglot-mode-map (kbd "C-c e f") 'eglot-format)
(define-key eglot-mode-map (kbd "C-c e s") 'eglot-shutdown)
(define-key eglot-mode-map (kbd "C-c e h") 'eldoc)

(provide 'init-eglot)
