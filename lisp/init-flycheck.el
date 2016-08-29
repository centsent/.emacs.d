;;; init-flycheck --- Flycheck Configurations
;;; Commentary:

;;; Code:

(require-package 'flycheck)

;; use eslint from node modules
(defun my/use-eslint-from-node-modules ()
  "."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (file-executable-p eslint)
      (defvar flycheck-javascript-eslint-executable)
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun flycheck-list-errors-only-when-errors ()
  "."
  (defvar flycheck-current-errors)
  (defvar flycheck-error-list-buffer)
  (if flycheck-current-errors
      (flycheck-list-errors)
    (-when-let (buffer (get-buffer flycheck-error-list-buffer))
      (dolist (window (get-buffer-window-list buffer))
        (quit-window nil window)))))

(when (require 'flycheck nil t)
  (global-flycheck-mode)
  (defvar flycheck-display-errors-function)
  ;; (add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
(add-hook 'web-mode-hook #'flycheck-mode)
(add-hook 'web-mode-hook #'my/use-eslint-from-node-modules)

(flycheck-add-mode 'javascript-eslint 'js2-mode)
(add-hook 'js2-mode-hook #'flycheck-mode)
(add-hook 'js2-mode-hook #'my/use-eslint-from-node-modules)

;; disable jshint since we prefer eslint checking
(defvar flycheck-disabled-checkers)
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
          '(json-jsonlist)))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
