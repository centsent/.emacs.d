;;; init-go.el --- configuration for golang mode.
;;; Commentary:

;;; Code:

(require-package 'go-mode)
(require-package 'go-autocomplete)
;; (require-package 'auto-complete)


;; (setenv "GOPATH" "/home/centsent/go")

;; (ac-config-default)

(defun go-mode-setup ()
  ;; Use goreturns instead of go-fmt
  (auto-complete-mode 1)
  (setq gofmt-command "goreturns")
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
