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
(require 'mad-org)
(require 'mad-haskell)
(require 'mad-javascript)
(require 'mad-nix)
(require 'mad-rtl)

;;; init.el ends here
