;;; init.el --- my emacs configuration
;;; Commentary:
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
;; (require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes

(require 'init-themes)

(require 'init-evil)
(require 'init-keys)
(require 'init-editing-utils)

(require 'init-git)

(require 'init-projectile)
(require 'init-helm)

;; (require 'init-org)

(require 'init-flycheck)
(require 'init-javascript)

(require 'init-typescript)

(require 'init-company)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-projectile helm projectile page-break-lines avy expand-region browse-kill-ring highlight-symbol diminish yaml-mode unfill undo-tree neotree indent-guide fullframe fill-column-indicator exec-path-from-shell editorconfig dockerfile-mode aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
