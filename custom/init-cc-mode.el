
(setq c-default-style "linux")

(defun c-mode-common-hook-setup ()
  "C/C++ only setup"
  (message "my-c-mode-setup called (buffer-file-name)=%s" (buffer-file-name))
  
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  
  (c-toggle-hungry-state 1)
  
  (local-set-key (kbd "C-x C-o") 'ff-find-other-file))


(add-hook 'c-mode-common-hook 'c-mode-common-hook-setup)

(provide 'init-cc-mode)
