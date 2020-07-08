(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t)
  (setq company-elisp-detect-function-context nil)
  (setq company-minimum-prefix-length 3))

(setq company-backends
        (cons 'company-capf
              (remove 'company-capf company-backends)))

(with-eval-after-load 'company
  (add-hook 'c-mode-common-hook 'company-mode))

(provide 'init-company)
