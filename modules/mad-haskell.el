;;; modules/mad-haskell.el --- Haskell mode -*- lexical-binding: t; -*-
;;; Commentary

;; Hakell with dante and/or lsp

;;; Code:
(require 'mad-core)
(require 'mad-lsp)

(use-package "lsp-haskell")

(use-package "haskell-mode"
  :hook (haskell-mode . mad-lsp))

(provide 'mad-haskell)
;;; mad-haskell.el ends here
