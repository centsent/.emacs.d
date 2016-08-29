;;; init-helm --- helm configurations
;;; Commentary:

;;; Code:
;; (require-package 'helm-config)
(require-package 'helm)
(require-package 'helm-projectile)

(helm-mode 1)

(helm-projectile-on)

(global-set-key (kbd "M-x") 'helm-M-x)

(helm-autoresize-mode t)

;; optional fuzzy matching for helm-M-x
(setq helm-M-x-fuzzy-match t)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(provide 'init-helm)
;;; init-helm.el ends here
