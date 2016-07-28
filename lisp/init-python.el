;;; PYTHON CONFIGURATION
;;; --------------------------------------
(require-package 'elpy)
;; (require-package 'py-autopep8)
(require-package 'py-yapf)


(elpy-enable)
(elpy-use-ipython)

;; enable autopep8 formatting on save
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; enable yapf formatting on save
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

(provide 'init-python)
