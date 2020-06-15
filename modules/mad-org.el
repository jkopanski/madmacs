;;; modules/mad-org.el --- Org -*- lexical-binding: t; -*-
;;; Commentary:

;; Basic org for now.
;; TODO:
;; * add babel code snippets execution
;; * add org-roam

(require 'mad-core)

(use-package org
  :ensure org-plus-contrib
  :config
  ;; Stop org-mode from highjacking shift-cursor keys.
  (setq org-replace-disputed-keys t)
  ;; Fancy bullets
  (use-package org-bullets
    :hook (org-mode . org-bullets-mode))
  ;; (use-package ob-typescript
  ;;   ;; :load-path "modules"
  ;;   :config
  ;;   (org-babel-do-load-languages
  ;;    'org-babel-load-languages
  ;;    '((typescript . t)
  ;;      (js . t))))
  ;;   (add-to-list 'org-babel-tangle-lang-exts '("typescript" . "ts"))
  ;;   (add-to-list 'org-babel-default-header-args:typescript '(:cmdline . "--types node"))

  ;; Code blocks
  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-edit-src-content-indentation 0))

(provide 'mad-org)
;;; mad-org.el ends here
