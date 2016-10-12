;;; init-go.el --- configuration for golang mode.
;;; Commentary:

;;; Code:

(require-package 'go-mode)
(require-package 'go-autocomplete)

(require 'auto-complete-config)
(require 'go-mode-autoloads)

(ac-config-default)

(provide 'init-go)
;;; init-go.el ends here
