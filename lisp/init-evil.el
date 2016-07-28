(require-package 'evil)
(require-package 'evil-nerd-commenter)
(require-package 'general)
(require-package 'evil-surround)

(evil-mode 1)

;; enable evil-surround globally
(global-evil-surround-mode 1)

;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)
    
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


(provide 'init-evil)
