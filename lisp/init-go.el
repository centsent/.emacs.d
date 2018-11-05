;;; init-go --- golang configurations
;;; Commentary:

;;; Code:
(require-package 'go-mode)

(defun go-mode-setup ()
  (company-mode 1)
  (set (make-local-variable 'company-backends) '(company-go))
  (editorconfig-apply)
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  )
(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init-go)
;;; init-go.el ends here
