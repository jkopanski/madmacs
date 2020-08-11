;;; modules/mad-org.el --- Org -*- lexical-binding: t; -*-
;;; Commentary:

;; Basic org for now.
;; TODO:
;; * add babel code snippets execution
;; * add org-roam

(require 'mad-core)

(use-package org-plus-contrib
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         :map org-mode-map
         ("C-c !" . org-time-stamp-inactive))
  :config
  (require 'ol-notmuch)
  ;; Stop org-mode from highjacking shift-cursor keys.
  (setq org-replace-disputed-keys t)
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

(defun my-auto-lightweight-mode ()
  "Start Org Superstar differently depending on the number of lists items."
  (let ((list-items
         (count-matches "^[ \t]*?\\([+-]\\|[ \t]\\*\\)"
                        (point-min) (point-max))))
    (unless (< list-items 100)
      (org-superstar-toggle-lightweight-lists)))
  (org-superstar))

;; Fancy bullets
(use-package org-superstar
  :hook ((org-mode . org-superstar-mode)
         ;; (org-mode . my-auto-lightweight-mode)
         )
  :config
  (setq org-superstar-special-todo-items t
        org-hide-leading-stars nil
        org-superstar-leading-bullet ?\s))

(provide 'mad-org)
;;; mad-org.el ends here
