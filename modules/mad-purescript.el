;;; modules/mad-purescript.el --- Purescript mode -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(require 'mad-core)
(require 'mad-completion)
(require 'mad-direnv)
(require 'mad-flycheck)

(use-package "psc-ide")

(use-package "purescript-mode"
  :requires psc-ide
  :mode "\\.purs$"
  :hook (purescript-mode . (lambda ()
                             (direnv-update-environment)
                             (pcs-ide-mode)
                             (company-mode)
                             (flycheck-mode)
                             ;; for whatever reason this gives me trouble
                             ;; (turn-on-purescript-indentation)
                             )))

(provide 'mad-purescript)
;;; mad-purescript.el ends here
