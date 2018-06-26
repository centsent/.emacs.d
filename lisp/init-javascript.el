;;; init-javascript --- Javascript Configurations
;;; Commentary:

;;; Code:

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'web-mode)
(require-package 'prettier-js)
(require-package 'add-node-modules-path)

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

(eval-after-load 'json-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

(eval-after-load 'js2-jsx-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

(eval-after-load 'js2-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

(eval-after-load 'web-mode
    '(progn
       (add-hook 'web-mode-hook #'add-node-modules-path)
       (add-hook 'web-mode-hook #'prettier-js-mode)))

(provide 'init-javascript)
;;; init-javascript.el ends here
