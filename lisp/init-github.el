;;; init-github --- Github Configurations
;;; Commentary:

;;; Code:

(require 'init-git)

(maybe-require-package 'yagist)
(require-package 'bug-reference-github)
(add-hook 'prog-mode-hook 'bug-reference-prog-mode)

(require-package 'github-clone)
(require-package 'github-issues)
(require-package 'magit-gh-pulls)

(provide 'init-github)
;;; init-github.el ends here
