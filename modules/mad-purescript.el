;;; modules/mad-purescript.el --- Purescript mode -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(require 'mad-core)
(require 'mad-completion)
(require 'mad-direnv)
(require 'mad-flycheck)

(defun mad-purs ()
  (direnv-update-environment)
  (pcs-ide-mode)
  (company-mode)
  (flycheck-mode)
  (turn-on-purescript-indentation))

(use-package "psc-ide")

(use-package "purescript-mode"
  :requires psc-ide
  :mode "\\.purs$"
  :hook mad-purs
  :init
  (add-to-list 'safe-local-variable-values
               '(purescript-mode-hook . mad-purs))
  (add-to-list 'safe-local-variable-values
               '(purescript-mode-hook . nil)))

(provide 'mad-purescript)
;;; mad-purescript.el ends here
