(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'web-mode)
(require-package 'web-beautify)

(require 'js2-mode)

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; use js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))


;; ;; web-beautify
;; (eval-after-load 'js2-mode
;;   '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; (eval-after-load 'json-mode
;;   '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;; (eval-after-load 'sgml-mode
;;   '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;; (eval-after-load 'web-mode
;;   '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
;; (eval-after-load 'css-mode
;;   '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))


(provide 'init-javascript)
