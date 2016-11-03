;;; init-exec-path.el --- Configuration for exec-path-from-shell
;;; Commentary:

;;; Code:
(require-package 'exec-path-from-shell)

(after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(exec-path-from-shell-copy-env "PATH")

(provide 'init-exec-path)
;;; init-exec-path.el ends here
