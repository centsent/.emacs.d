;;; init-osx-keys --- Remap keys on OSX
;;; Commentary:

;;; Code:
(defvar *is-a-mac*)
(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)

  ;; (setq-default default-input-method "MacOSX")
  ;; ;; Make mouse wheel / trackpad scrolling less jerky
  ;; (setq mouse-wheel-scroll-amount '(1
  ;;                                   ((shift) . 5)
  ;;                                   ((control))))
  ;; (dolist (multiple '("" "double-" "triple-"))
  ;;   (dolist (direction '("right" "left"))
  ;;     (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  ;; (global-set-key (kbd "M-`") 'ns-next-frame)
  ;; (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  ;; (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  ;; (after-load 'nxml-mode
  ;;   (defvar nxml-mode-map)
  ;;   (define-key nxml-mode-map (kbd "M-h") nil))
  ;; (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
  )


(provide 'init-osx-keys)
;;; init-osx-keys.el ends here
