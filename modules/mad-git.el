;;; modules/mad-git.el --- git intergation -*- lexical-binding: t; -*-
;;; Commentary:

;; Beside standard magit integrate forges ond git gutter

;;; Code:

(require 'mad-core)

;; Invoke Magit by typing C-x g, and you can thank me later.
;; See http://magit.github.io/ for instructions.
(use-package "magit"
  :commands magit-status
  :bind ("C-x g" . magit-status))

(use-package "forge")

;; Use M-x gist-buffer or M-x gist-region to create a gist
;; directly from the current buffer or selection.
(use-package "gist")

;; Mark uncommitted changes in the fringe.
(use-package "git-gutter-fringe"
  :delight
  :config
  (global-git-gutter-mode t))

(provide 'mad-git)
;;; mad-git.el ends here
