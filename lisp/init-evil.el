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

;; TAB to indent in normal-state
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
(define-key evil-normal-state-map "H" 'evil-beginning-of-line)
(define-key evil-visual-state-map "H" 'evil-beginning-of-line)
(define-key evil-motion-state-map "H" 'evil-beginning-of-line)
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-visual-state-map "L" 'evil-end-of-line)
(define-key evil-motion-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)

;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;; evil-nerd-commenter
(evilnc-default-hotkeys)

(general-evil-setup t)
;; use `,` as leader key
(nvmap :prefix ","
       "w" 'evil-write
       "q" 'evil-quit
       "x" 'evil-save-and-quit
       "f" 'ido-find-file
       "b" 'ibuffer
       "eb" 'eval-buffer)

;move line up down
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

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line ARG lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line ARG lines up."
  (interactive "*p")
  (move-text-internal (- arg))
  (forward-line -1))
                                        
(define-key evil-normal-state-map (kbd "C-j") 'move-text-down)
(define-key evil-normal-state-map (kbd "C-k") 'move-text-up)
                                          
(provide 'init-evil)                     
;;; init-evil.el ends here
