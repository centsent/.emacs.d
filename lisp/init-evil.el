;;; init-evil.el --- configuration for evils.
;;; Commentary:

;;; Code:

(require-package 'evil)
(require-package 'evil-nerd-commenter)
(require-package 'general)
(require-package 'evil-surround)
(require-package 'evil-tabs)

(evil-mode 1)

;; enable evil-surround globally
(global-evil-surround-mode 1)

(defvar evil-insert-state-map)
(defvar evil-normal-state-map)
(defvar evil-visual-state-map)
(defvar evil-motion-state-map)

;; Move text.
(defun move-text-internal (arg)
  "Move region (transient-mark-mode active) or current line by ARG direction."
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

;; Move text down.
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line ARG lines down."
  (interactive "*p")
  (move-text-internal arg))

;; Move text up.
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line ARG lines up."
  (interactive "*p")
  (move-text-internal (- arg))
  (forward-line -1))

;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)

;; Use < to shrink window horizontally.
(define-key evil-normal-state-map (kbd "<") 'shrink-window-horizontally)
;; Use > to enlarge window horizontally.
(define-key evil-normal-state-map (kbd ">") 'enlarge-window-horizontally)

;; Use { to enlarge window
(define-key evil-normal-state-map (kbd "{") 'enlarge-window)
;; Use } to shrink-window
(define-key evil-normal-state-map (kbd "}") 'shrink-window)

;; TAB to switch to other window
(define-key evil-normal-state-map (kbd "C-w") 'switch-window)
;; TAB to indent in visual-state
(define-key evil-visual-state-map (kbd "TAB") 'for-tab-command)

;; Use C-j to move current line down.
(define-key evil-normal-state-map (kbd "C-j") 'move-text-down)
;; Use C-k to move current line up.
(define-key evil-normal-state-map (kbd "C-k") 'move-text-up)

;; C-h to backspace
(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
(define-key evil-insert-state-map (kbd "M-h") 'backward-kill-word)

;; C-j to switch back normal-state
(define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-j") 'evil-normal-state)

;; C-p to find file in project
(define-key evil-normal-state-map (kbd "C-p") 'find-file-in-project)

;; C-b to scroll up
(define-key evil-normal-state-map (kbd "C-b") 'evil-scroll-up)

;; (require-package 'multiple-cursors)
;; multiple-cursors
;; (define-key evil-insert-state-map (kbd "C-c C-n") 'mc/mark-next-like-this)
;; (define-key evil-insert-state-map (kbd "C-c C-p") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-+") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; ;; From active region to multiple cursors:
;; (global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
;; (global-set-key (kbd "C-c c c") 'mc/edit-lines)
;; (global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
;; (global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

;; Use H to move the cursor to the first character of current screen line.
(define-key evil-normal-state-map "H" (kbd "^"))
(define-key evil-visual-state-map "H" (kbd "^"))
(define-key evil-motion-state-map "H" (kbd "^"))

;; Use L to move the cursor to the end of current line.
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-visual-state-map "L" 'evil-end-of-line)
(define-key evil-motion-state-map "L" 'evil-end-of-line)

;; Use U to redo.
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)

;; Use j/k to move one visual line insted of gj/gk.
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;; evil-nerd-commenter use default hotkeys.
(evilnc-default-hotkeys)

;; general
(general-evil-setup t)

;; Use `,` as leader key
(nvmap :prefix ","
       "w" 'evil-write
       "q" 'evil-quit
       "d" 'kill-paragraph
       "x" 'evil-save-and-quit
       "f" 'helm-find-files
       "b" 'ibuffer
       "p" 'projectile-switch-project
       "eb" 'eval-buffer
       "mt" 'multi-term
       "md" 'multi-term-dedicated-toggle
       "mg" 'magit-status)

;; Use `SPC` as leader key
(nvmap :prefix "SPC"
       "0" 'delete-window
       "1" 'delete-other-windows
       "2" 'split-window-below
       "3" 'split-window-right)

(provide 'init-evil)
;;; init-evil.el ends here
