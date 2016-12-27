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

(require 'init-osx-keys)
(require 'init-themes)
(require 'init-ido)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-emmet)

(require 'init-evil)

(require 'init-python)
(require 'init-go)
(require 'init-javascript)
(require 'init-flycheck)

(require 'init-gui-frames)
;; (require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-grep)
;; (require 'init-uniquify)
(require 'init-ibuffer)

(require 'init-helm)

;; (require 'init-recentf)
(require 'init-hippie-expand)
(require 'init-windows)
;; (require 'init-sessions)
;; (require 'init-fonts)
;; (require 'init-mmm)

(require 'init-editing-utils)
(require 'init-whitespace)
;; (require 'init-fci)

;; (require 'init-vc)
;; (require 'init-darcs)
(require 'init-git)
(require 'init-github)

(require 'init-projectile)
(require 'init-multi-term)

;; (require 'init-compile)
;; (require 'init-crontab)
;; (require 'init-textile)
(require 'init-markdown)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
;; (require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
(require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)


(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (powerline-evil fcitx yaml-mode all-the-icons neotree company-go auto-complete-config go-autocomplete go-mode-autoloads go-mode yagist whole-line-or-region whitespace-cleanup-mode wgrep-ag web-mode web-beautify unfill tern-auto-complete switch-window solarized-theme smex skewer-less session scss-mode sass-mode rainbow-mode py-yapf powerline persp-projectile page-break-lines multiple-cursors multi-term move-dup mmm-mode markdown-mode magit-gh-pulls less-css-mode json-mode js-doc indent-guide idomenu ido-ubiquitous ibuffer-vc highlight-symbol highlight-escape-sequences helm-projectile helm-dash gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blame general fullframe flycheck fill-column-indicator expand-region exec-path-from-shell evil-tabs evil-surround evil-nerd-commenter espresso-theme emmet-mode elpy editorconfig disable-mouse diminish css-eldoc company-tern company-quickhelp bug-reference-github browse-kill-ring better-defaults avy autopair atom-one-dark-theme ample-theme aggressive-indent ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
