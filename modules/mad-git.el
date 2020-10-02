;;; modules/mad-git.el --- git intergation -*- lexical-binding: t; -*-
;;; Commentary:

;; Beside standard magit integrate forges ond git gutter

;;; Code:

(require 'mad-core)

;; I've deliberately disabled straight here because forge,
;; depends on binary from emacsql-sqlite.
;; With straight enabled it won't find it in nix store.
(use-package magit
  :straight nil
  :commands magit-status
  :ryo
  ("SPC" (("g" magit-status :name "git status")))
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package forge :straight nil)

(use-package gist)

(use-package git-gutter-fringe
  :delight
  :config
  (global-git-gutter-mode t))

(provide 'mad-git)
;;; mad-git.el ends here
