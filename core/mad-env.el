;;; core/mad-env.el --- Set path and other env variables -*- lexical-binding: t; -*-
;;; Commentary:

;; Instead of writing elaborate procedures dump all of the work
;; on `direnv' package to use per project setting and integrate
;; with nix shells.

;;; Code:

(require 'mad-package)

(use-package "direnv"
  :config
  (direnv-mode))

(provide 'mad-env)

;;; mad-env.el ends here
