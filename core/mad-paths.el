;;; core/mad-paths.el --- Set load-path -*- lexical-binding: t; -*-

;;; Commentary:

;; Expand load-path to contain madmacs directories.
;; Perhaps this could be replaced by stealing load!
;; macro from doom

;;; Code:

(defun add-to-load-path (dir)
  (add-to-list 'load-path dir))

(defvar mad-core-directory
  (expand-file-name (concat user-emacs-directory "core/"))
  "Madmacs core directory.")

(defvar mad-modules-directory
  (expand-file-name (concat user-emacs-directory "modules/"))
  "Madmacs modules directory.")

(defvar mad-package-dir
  (expand-file-name (concat user-emacs-directory "packages/"))
  "Madmacs will put installed packages here.")

(mapc 'add-to-load-path (list mad-core-directory
                              mad-modules-directory))
(setq package-user-dir mad-package-dir)

(provide 'mad-paths)
;;; mad-paths.el ends here
