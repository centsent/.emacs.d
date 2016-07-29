;;; init.el --- my emacs configuration
;;; Commentary:
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Measure startup time
(require 'init-benchmarking)

(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-basic)
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
;;----------------------------------------------------------------------------

(require-package 'better-defaults)
(require-package 'magit)
(require-package 'autopair)
(require-package 'undo-tree)

(autopair-global-mode) ;; enable autopair in all buffers
(global-undo-tree-mode)


(require 'init-osx-keys)
(require 'init-themes)
(require 'init-editorconfig)
(require 'init-smex)
(require 'init-ido)
;; (require 'init-helm)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-emmet)

(require 'init-evil)

(require 'init-python)
(require 'init-javascript)
(require 'init-flycheck)

;; (require 'init-gui-frames)
;; (require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-grep)
;; (require 'init-uniquify)
(require 'init-ibuffer)

;; (require 'init-recentf)
(require 'init-ido)
;; (require 'init-hippie-expand)
;; (require 'init-company)
;; (require 'init-windows)
;; (require 'init-sessions)
;; (require 'init-fonts)
;; (require 'init-mmm)

;; (require 'init-editing-utils)
;; (require 'init-whitespace)
;; (require 'init-fci)

;; (require 'init-vc)
;; (require 'init-darcs)
;;(require 'init-git)
;; (require 'init-github)

(require 'init-projectile)

(require 'init-multi-term)

;; (require 'init-compile)
;; (require 'init-crontab)
;; (require 'init-textile)
;; (require 'init-markdown)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
;; (require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)


(provide 'init)
