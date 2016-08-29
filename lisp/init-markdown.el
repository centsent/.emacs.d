;;; init-markdown --- markdown settings
;;; Commentary:

;;; Code:

(when (maybe-require-package 'markdown-mode)
  (after-load 'whitespace-cleanup-mode
    (defvar whitespace-cleanup-mode-ignore-modes)
    (push 'markdown-mode whitespace-cleanup-mode-ignore-modes)))


(provide 'init-markdown)
;;; init-markdown.el ends here
