
;; eglot for lsp
(use-package eglot
  :ensure t)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

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

(provide 'init-eglot)