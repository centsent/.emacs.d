;;; init-multi-term.el --- Multi term configurations.
;;; Commentary:

;;; Code:

(require-package 'multi-term)

(defvar multi-term-program)
(defvar term-bind-key-alist)

(setq multi-term-program "/bin/zsh")

(setq term-bind-key-alist
      '(("C-c C-c" . term-interrupt-subjob)
        ("C-d" . term-interrupt-subjob)
        ("C-p" . term-send-up)
        ("C-n" . term-send-down)
        ("C-k" . term-send-kill-whole-line)
        ("C-y" . yank)
        ("M-f" . term-send-forward-word)
        ("M-b" . term-send-backward-word)
        ("M-K" . term-send-kill-line)
        ("M-p" . previous-line)
        ("M-n" . next-line)
        ("C-w" . switch-window)))


(provide 'init-multi-term)
;;; init-multi-term.el ends here
