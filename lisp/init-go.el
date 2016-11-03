;;; init-go.el --- configuration for golang mode.
;;; Commentary:

;;; Code:

(require-package 'go-mode)
(require-package 'go-autocomplete)

(setenv "GOPATH" "/Users/centsent/workspace/vagrant/gopath")

(require 'go-mode-autoloads)

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

(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init-go)
;;; init-go.el ends here
