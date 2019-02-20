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
;;   which is Copyright (c) Copyright (c) Bodil Stokke

;;; Code:

(load-file (concat (file-name-directory load-file-name)
                   "core/mad-paths.el"))
(require 'mad-core (concat user-emacs-directory "core/mad-core"))

;; enable default modules
(require 'mad-completion)

(require 'mad-haskell)
(require 'mad-javascript)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (haskell-mode xah-fly-keys which-key web-mode use-package typescript-mode smartparens smart-mode-line rjsx-mode projectile paradox modalka material-theme lsp-ui flycheck direnv diminish delight company-quickhelp company-lsp all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
