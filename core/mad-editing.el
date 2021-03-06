;;; core/mad-editing.el --- Glabal editing setup -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)

(use-package ethan-wspace
  :demand t
  :delight
  :commands global-ethan-wspace-mode
  :config
  (global-ethan-wspace-mode 1))

(setq mode-require-final-newline nil)
(setq require-final-newline nil)

(provide 'mad-editing)
;;; mad-editing.el ends here
