;;; modules/mad-agda.el --- Agda mode -*- lexical-binding: t; -*-
;;; Commentary:

;;; This requires agda on the PATH.
;;; It will run direnv first, to hopefully get the required executables

;;; Code:

(require 'mad-core)
(require 'mad-direnv)

(defun mad-agda-locate ()
  "Try to figure out where agda-mode is located."
  (direnv-update-environment)
  (file-name-directory
   (let ((coding-system-for-read 'utf-8))
     (shell-command-to-string "agda-mode locate"))))

(mapc
 (lambda (x) (add-to-list 'face-remapping-alist x))
 '((agda2-highlight-datatype-face              . font-lock-type-face)
   (agda2-highlight-function-face              . font-lock-type-face)
   (agda2-highlight-inductive-constructor-face . font-lock-function-name-face)
   (agda2-highlight-keyword-face               . font-lock-keyword-face)
   (agda2-highlight-module-face                . font-lock-constant-face)
   (agda2-highlight-number-face                . nil)
   (agda2-highlight-postulate-face             . font-lock-type-face)
   (agda2-highlight-primitive-type-face        . font-lock-type-face)
   (agda2-highlight-record-face                . font-lock-type-face)))

(defun mad-agda2-mode ()
  "Custom agda mode hook, that tries to figure out emacs-agda location."
  (defvar agda2-directory (mad-agda-locate)
    "The same behaviour as agda2.el, it is used anywhere")
  (if (boundp 'agda2-directory)
      (add-to-list 'load-path agda2-directory))

  (require 'agda2-mode)
  (agda2-mode))

(add-to-list 'auto-mode-alist '("\\.agda$" . mad-agda2-mode))
(add-to-list 'auto-mode-alist '("\\.lagda.md" . mad-agda2-mode))

(provide 'mad-agda)
;;; mad-agda.el ends here
