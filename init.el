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
;; Bauer’s Automated Unified Emacs Realm
;;   which is Copyright (c) Matthew Bauer

;;; Code:

;; Increasing GC is a common way to speed up Emacs.
;; gc-cons-threshold sets at what point Emacs should invoke its garbage collector.
;; Some people set it to a really larger number permanently.
;; This works well until the garbage is actually collected (then you have to wait a long time).
;; I’ve decided to just set it temporarily to a large number so we only garbage collect once on startup.
;; After that we reset it to the standard value.
;; Read [1] post for more info on this.
;; [1]: http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(setq my-gc-cons-threshold 10000000)
(defvar file-name-handler-alist-backup
        file-name-handler-alist)
(setq gc-cons-threshold most-positive-fixnum
      file-name-handler-alist nil)
(add-hook 'after-init-hook
  (lambda ()
    (garbage-collect)
    (setq gc-cons-threshold my-gc-cons-threshold)
      file-name-handler-alist
        (append
          file-name-handler-alist-backup
          file-name-handler-alist)))

;; While the minibuffer is open, garbage collection will never occur, but once we make a selection, or cancel,
;; garbage collection will kick off immediately and then revert back to the default, sensible behavior.
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold
        (car (get 'gc-cons-threshold my-gc-cons-threshold))))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;;ncrease the amount of data which Emacs reads from the process.
;; Again the emacs default is too low 4k considering that the some
;; of the language server responses are in 800k - 3M range.
(setq read-process-output-max (* 4 1024 1024)) ;; 4mb

;; Set my paths
(require 'mad-paths (concat (file-name-directory load-file-name)
                            "core/mad-paths.el"))
;; Load the rest of the config
(require 'mad-core (concat user-emacs-directory "core/mad-core"))

;; enable default modules
(require 'mad-window)
(require 'mad-org)
(require 'mad-git)
(require 'mad-mail)
(require 'mad-haskell)
;; (require 'mad-purescript)
(require 'mad-javascript)
(require 'mad-nix)
(require 'mad-ledger)
;; (require 'mad-racket)
(require 'mad-rtl)
(require 'mad-agda)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((dante-repl-command-line "stack" "ghci" "--ghci-options" "-fdiagnostics-color=never"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
