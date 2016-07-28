(require-package 'yasnippet)

(when (require 'yasnippet)
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(provide 'init-yasnippet)
