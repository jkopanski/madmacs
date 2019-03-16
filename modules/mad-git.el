;;; modules/mad-git.el --- git intergation -*- lexical-binding: t; -*-
;;; Commentary:

;; Beside standard magit integrate forges ond git gutter

;;; Code:

(require 'mad-core)

(use-package "magit"
  :commands magit-status
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package "forge")

(use-package "gist")

(use-package "git-gutter-fringe"
  :delight
  :config
  (global-git-gutter-mode t))

(provide 'mad-git)
;;; mad-git.el ends here
