;;; init-emmet --- emmet settings
;;; Commentary:

;;; Code:

(require-package 'emmet-mode)

;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'emmet-mode)
;; enable Emmet's css abbreviation.
(add-hook 'css-mode-hook  'emmet-mode)

(provide 'init-emmet)
;;; init-emmet.el ends here
