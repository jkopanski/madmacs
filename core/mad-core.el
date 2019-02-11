;;; core/core.el --- Require all submodules -*- lexical-binding: t; -*-
;;; Commentary:

;; Require and load all of the Madmacs submodules

;;; Code:

(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system        'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

(require 'mad-paths)
(require 'mad-package)
(require 'mad-ui)
(require 'mad-visual)
(require 'mad-project)
(require 'mad-utils)

(provide 'mad-core)
;;; mad-core.el ends here
