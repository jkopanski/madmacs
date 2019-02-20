;;; modules/mad-org.el --- Org -*- lexical-binding: t; -*-
;;; Commentary:

;; Basic org for now.
;; TODO:
;; * add babel code snippets execution
;; * add org-brain

(require 'mad-core)

(use-package "org"
  :ensure org-plus-contrib
  :config
  ;; Stop org-mode from highjacking shift-cursor keys.
  (setq org-replace-disputed-keys t)
  ;; Fancy bullets
  (use-package "org-bullets"
    :hook org-mode))

(provide 'mad-org)
;;; mad-org.el ends here
