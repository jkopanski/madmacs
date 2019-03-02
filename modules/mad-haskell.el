;;; modules/mad-haskell.el --- Haskell mode -*- lexical-binding: t; -*-
;;; Commentary:

;; Pretty empty haskell mode for now.
;; TODO:
;; * enable lsp when available
;; * dante for repl interaction

;;; Code:

(require 'mad-core)
(require 'mad-lsp)

(use-package "lsp-haskell")

(use-package "haskell-mode"
  :mode "\\.hs$"
  :mode ("\\.ghci" . ghci-script-mode)
  :mode ("\\.cabal" . haskell-cabal-mode)
  :interpreter (("runghc" . haskell-mode)
		("runhaskell" . haskell-mode))
  :hook (haskell-mode . mad-lsp))

(provide 'mad-haskell)
;;; mad-haskell.el ends here
