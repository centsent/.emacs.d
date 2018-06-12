;;; init-themes --- Themes Configuration
;;; Commentary:

;;; Code:

;; (require-package 'atom-one-dark-theme)
;; (require-package 'solarized-theme)
(require-package 'ample-theme)
(require-package 'powerline)
;; (require-package 'powerline-evil)

;; (load-theme 'atom-one-dark t)
(powerline-default-theme)
;; (powerline-evil-vim-color-theme)
;; (display-time-mode t)

;; (load-theme 'solarized-dark t)

(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)

;; Disable the menu bar
(menu-bar-mode -1) 

;; Disable the scrollbar
(toggle-scroll-bar -1)

;; Disable the toolbar
(tool-bar-mode -1) 

(provide 'init-themes)
;;; init-themes.el ends here
