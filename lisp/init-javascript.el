;;; init-javascript --- Javascript Configurations
;;; Commentary:

;;; Code:

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'web-mode)
(require-package 'web-beautify)

(require 'js2-mode)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js-mode-hook 'auto-complete-mode)

(setq-default js2-global-externs '("process"
                                   "module"
                                   "require"
                                   "buster"
                                   "sinon"
                                   "assert"
                                   "refute"
                                   "setTimeout"
                                   "clearTimeout"
                                   "setInterval"
                                   "clearInterval"
                                   "location"
                                   "__dirname"
                                   "console"
                                   "JSON"))


;; (add-to-list 'company-backends 'company-tern)

;; use js2-jsx-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
;; use js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  "."
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-trailing-comma-warning nil)


(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'js2-jsx-mode
  '(add-hook 'js2-jsx-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(add-hook 'html-mode-hook 'emmet-mode)
(eval-after-load 'sgml-mode
  '(add-hook 'html-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

(add-hook 'web-mode-hook 'emmet-mode)
(eval-after-load 'web-mode
  '(add-hook 'web-mode-hook
             (lambda ()
               ;; short circuit js mode and just do everything in jsx-mode
               (if (equal web-mode-content-type "javascript")
                   (web-mode-set-content-type "jsx")
                 (message "now set to: %s" web-mode-content-type))
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(add-hook 'css-mode-hook 'emmet-mode)
(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))


(provide 'init-javascript)
;;; init-javascript.el ends here
