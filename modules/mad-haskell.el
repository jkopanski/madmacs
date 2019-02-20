;;; modules/mad-haskell.el --- Haskell mode -*- lexical-binding: t; -*-
;;; Commentary:

;; Pretty empty haskell mode for now.
;; TODO:
;; * enable lsp when available
;; * dante for repl interaction

(require 'mad-core)

(use-package "haskell-mode"
  :mode "\\.hs$"
  :mode ("\\.ghci" . ghci-script-mode)
  :mode ("\\.cabal" . haskell-cabal-mode)
  :interpreter (("runghc" . haskell-mode)
		("runhaskell" . haskell-mode)))

(provide 'mad-haskell)
;;; mad-haskell.el ends here
