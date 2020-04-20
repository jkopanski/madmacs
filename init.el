;;; init.el --- Emacs config of Jakub Kopański -*- lexical-binding: t; -*-

;;; Commentary:

;; This mostly rips off from:
;; doom-emacs https://github.com/hlissner/doom-emacs
;;   which is Copyright (c) Henrik Lissner.
;; spacemacs http://spacemacs.org/
;;   which is Copyright (c) 2012-2017 Sylvain Benner & Contributors
;; Mark Karpov emacs config https://github.com/mrkkrp/dot-emacs
;;   which is Copyright (c) Mark Karpov
;; ohai-emacs https://github.com/bodil/ohai-emacs
;;   which is Copyright (c) Bodil Stokke

;;; Code:

(load-file (concat (file-name-directory load-file-name)
                   "core/mad-paths.el"))
(require 'mad-core (concat user-emacs-directory "core/mad-core"))

;; enable default modules
(require 'mad-org)
(require 'mad-git)
(require 'mad-haskell)
(require 'mad-purescript)
(require 'mad-javascript)
(require 'mad-nix)
(require 'mad-ledger)
(require 'mad-racket)
(require 'mad-rtl)
(require 'mad-agda)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (firrtl-mode racket-mode hledger-mode company-nixos-options nix-update nix-mode typescript-mode rjsx-mode web-mode lsp-haskell lsp-ui company-lsp lsp-mode flycheck direnv git-gutter-fringe gist forge magit org-bullets org-plus-contrib modalka which-key projectile ethan-wspace smartparens all-the-icons smart-mode-line nord-theme delight use-package paradox))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
