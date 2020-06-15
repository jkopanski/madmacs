;;; core/mad-package.el --- Package management -*- lexical-binding: t; -*-

;;; Commentary:

;; I'll use `straight.el` for package installing etc.
;; That package itself however is made available via Nix,
;; so I omit the bootstrapping code.
;;
;; Use of `package.el` is banned here.
;;
;; This should lead me to have somewhat semiportable config,
;; that should work on other systems than nix.

;;; Code:

;; Setting this to non nil,m akes each use-package form also invoke `straight.el` to install the package,
;; unless otherwise specified.
;; If `use-package` cannot find the package it will not use it.
;; So with this set to nil I can have packages managed by nix,
;; or locally by `straight.el` when used like:
;; (use-package foo :straight t)
;; Flipping this to 't is also easy way to make this config work out of nix
(setq straight-use-package-by-default t)

(load "bootstrap.el")
(require 'use-package)

;; TODO: do I need this if I don't use `package.el`
;; bug in Emacs: https://debbugs.gnu.org/34341.
;; It should be fixed in Emacs 26.3+
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(provide 'mad-package)
;;; mad-package.el ends here
