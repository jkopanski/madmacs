;;; modules/mad-nix.el --- Nix the language mode -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(require 'mad-core)

(use-package nix-mode
  :mode "\\.nix$")

(use-package nix-update
  :after nix-mode)

(use-package company-nixos-options
  :config
  (add-to-list 'company-backends 'company-nixos-options))

(provide 'mad-nix)
;;; mad-nix.el ends here
