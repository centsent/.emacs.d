;;; init-evil.el --- configuration for evils.
;;; Commentary:

;;; Code:

(require-package 'evil)
(require-package 'evil-nerd-commenter)
(require-package 'general)
(require-package 'evil-surround)

(evil-mode 1)

;; enable evil-surround globally
(global-evil-surround-mode 1)

(defvar evil-insert-state-map)
(defvar evil-normal-state-map)
(defvar evil-visual-state-map)
(defvar evil-motion-state-map)

;; Move text.
(defun move-text-internal (arg)
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

;; Use C-j to move current line down.
(define-key evil-normal-state-map (kbd "C-j") 'move-text-down)
;; Use C-k to move current line up.
(define-key evil-normal-state-map (kbd "C-k") 'move-text-up)
 

;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)
    
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

;; TAB to switch to other window
(define-key evil-normal-state-map (kbd "TAB") 'other-window)
;; TAB to indent in visual-state
(define-key evil-visual-state-map (kbd "TAB") 'for-tab-command)

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

;; use `,` as leader key
(nvmap :prefix ","
       "w" 'evil-write
       "q" 'evil-quit
       "x" 'evil-save-and-quit
       "f" 'ido-find-file
       "b" 'ibuffer
       "eb" 'eval-buffer
       "mt" 'multi-term
       "md" 'multi-term-dedicated-toggle)

;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
(nvmap :prefix "SPC"
       "0" 'delete-window
       "1" 'delete-other-windows
       "2" 'split-window-below
       "3" 'split-window-right)

                                         
(provide 'init-evil)                     
;;; init-evil.el ends here
