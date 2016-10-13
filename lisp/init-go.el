;;; init-go.el --- configuration for golang mode.
;;; Commentary:

;;; Code:

(require-package 'go-mode)
(require-package 'go-autocomplete)

(require 'auto-complete-config)
(require 'go-mode-autoloads)

(ac-config-default)

(defun go-mode-setup ()
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ;; Go oracle
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el"))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'go-mode-hook 'auto-complete-for-go)


(provide 'init-go)
;;; init-go.el ends here
