;;; core/mad-package.el --- Package management -*- lexical-binding: t; -*-

;;; Commentary:

;; Use standard package for now, but maybe copy from doom later?

;;; Code:

(require 'mad-paths)

;; built-in package manager inside Emacs
(require 'package)
;; bug in Emacs: https://debbugs.gnu.org/34341.
;; It should be fixed in Emacs 26.3+
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; by default gets packages only from elpa
(dolist (repository '(("melpa" . "https://melpa.org/packages/")
                      ("org"   . "https://orgmode.org/elpa/")))
  (add-to-list 'package-archives repository))

;; start package manager
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'paradox)
  (package-install 'paradox))

(paradox-require 'use-package)
(require 'use-package)

;; This makes use package install every declared package.
(setq use-package-always-ensure t)

(provide 'mad-package)
;;; mad-package.el ends here
