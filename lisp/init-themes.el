;;; init-themes --- Themes Configuration
;;; Commentary:

;;; Code:

;; (require-package 'atom-one-dark-theme)
;; (require-package 'solarized-theme)
(require-package 'ample-theme)
(require-package 'powerline)

;; (load-theme 'atom-one-dark t)
(powerline-default-theme)

;; (load-theme 'solarized-dark t)

(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)

(provide 'init-themes)
;;; init-themes.el ends here
