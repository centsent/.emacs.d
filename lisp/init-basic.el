;;; init-basic.el --- BASIC CUSTOMIZATION
;;; Commentary:

;;; Code:

;; stop creating #autosave# files
(setq auto-save-default nil)

;; hide the startup message
(setq inhibit-startup-message t)

;; enable line numbers globally
(global-linum-mode t)

;; enable auto revert
(global-auto-revert-mode 1)

;; enable fullscreen
(toggle-frame-fullscreen)


(provide 'init-basic)
;;; init-basic.el ends here
