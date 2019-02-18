;;; modules/mad-flycheck.el --- Flycheck -*- lexical-binding: t; -*-

;;; Commentary:

;; Install basic Flycheck.

;;; Code:

(require 'mad-package)

(use-package "flycheck"
  :delight
  :commands (flycheck-mode flycheck-list-errors flycheck-buffer)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'mad-flycheck)
;;; mad-flycheck.el ends here
