;;; modules/mad-javascript.el --- JavaScript mode -*- lexical-binding: t; -*-
;;; Commentary:

;; JavaScript editing using lsp.

;;; Code:

(require 'mad-core)
(require 'mad-lsp)
(require 'typescript-tsx-mode)

(use-package rjsx-mode
  :mode "\\.jsx?$"
  :hook (rjsx-mode . mad-lsp)
  :config
  (setq js-indent-level 2))

(use-package typescript-mode
  :mode "\\.ts$"
  :hook (typescript-mode . mad-lsp)
  :config
  (setq typescript-indent-level 2))

(provide 'mad-javascript)
;;; mad-javascript.el ends here
