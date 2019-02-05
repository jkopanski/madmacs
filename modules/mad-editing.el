;;; modules/mad-editing.el --- Navigation and editing -*- lexical-binding: t; -*-
;;; Commentary:

;; File and directory navigation using `dired'.
;; Modal editing with modalka.

;;; Code:

(require 'mad-core)

(setq
 dired-auto-revert-buffer   t
 dired-clean-up-buffers-too t
 dired-dwim-target          t
 dired-keep-marker-copy     nil
 dired-keep-marker-rename   nil
 dired-listing-switches     "-GAlh --group-directories-first"
 dired-recursive-copies     'always
 dired-recursive-deletes    'always)

(use-package "modalka"
  :commands modalka-mode
  :bind (("C-<return>" . #'modalka-mode)))

(provide 'mad-editing)
;;; mad-editing.el ends here
