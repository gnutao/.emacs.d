(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t)
  (setq company-elisp-detect-function-context nil)
  (setq company-minimum-prefix-length 3))

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode))

(use-package company-c-headers
  :ensure t)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map
      [remap completion-at-point] 'counsel-irony)
  (define-key irony-mode-map
      [remap complete-symbol] 'counsel-irony))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(use-package company-irony
  :ensure t
  :config
  (require 'company)
  (add-to-list 'company-backend 'company-irony))

(require 'company-elisp)

(setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-preview-if-just-one-frontend))

(setq company-backends
      '(company-elisp
        ;; company-semantic
	company-c-headers
	company-clang
	company-irony
        company-capf
        (company-dabbrev-code company-gtags company-etags
         company-keywords)
        company-files
        company-dabbrev))

(defun ora-company-number ()
  "Forward to `company-complete-number'.

Unless the number is potentially part of the candidate.
In that case, insert the number."
  (interactive)
  (let* ((k (this-command-keys))
         (re (concat "^" company-prefix k)))
    (if (or (cl-find-if (lambda (s) (string-match re s))
                        company-candidates)
            (> (string-to-number k)
               (length company-candidates))
            (looking-back "[0-9]+\\.[0-9]*" (line-beginning-position)))
        (self-insert-command 1)
      (company-complete-number
       (if (equal k "0")
           10
         (string-to-number k))))))

;;(defun ora--company-good-prefix-p (orig-fn prefix)
;;  (unless (and (stringp prefix) (string-match-p "\\`[0-9]+\\'" prefix))
;;    (funcall orig-fn prefix)))
;; (ora-advice-add 'company--good-prefix-p :around #'ora--company-good-prefix-p)

(let ((map company-active-map))
  (mapc (lambda (x) (define-key map (format "%d" x) 'ora-company-number))
        (number-sequence 0 9))
  (define-key map " " (lambda ()
                        (interactive)
                        (company-abort)
                        (self-insert-command 1)))
  (define-key map (kbd "<return>") nil))

(setq company-c-headers-path-system '("/usr/include/c++/7.5.0" "/usr/include/" "/usr/local/include"))

(with-eval-after-load 'company
  (add-hook 'c-mode-common-hook 'company-mode))

(provide 'init-company)
