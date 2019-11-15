;;; init-go --- golang configurations
;;; Commentary:

;;; Code:
(require-package 'go-mode)
(require-package 'company-go)
(require-package 'go-complete)


(defun go-mode-setup ()
  (company-mode 1)
  (set (make-local-variable 'company-backends) '(company-go))
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing


  (editorconfig-apply)
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goreturns")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

(provide 'init-go)
;;; init-go.el ends here
