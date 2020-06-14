
(setq c-default-style "linux")

(defun c-mode-common-hook-setup ()
  "C/C++ only setup"
  (message "my-c-mode-setup called (buffer-file-name)=%s" (buffer-file-name))
  
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  
  (c-toggle-hungry-state 1)
  
  (local-set-key (kbd "C-x C-o") 'ff-find-other-file))


(add-hook 'c-mode-common-hook 'c-mode-common-hook-setup)

(use-package ggtags
:ensure t
:config 
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)))))

(provide 'init-cc-mode)
