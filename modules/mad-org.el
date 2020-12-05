;;; core/mad-org.el --- Org -*- lexical-binding: t; -*-
;;; Commentary:

;; This in core in order to make sure I am using org from straight and not bundled with emacs.
;; Keybindings for global actions are set in `mad-keys'

;;; Code:

(require 'mad-core)
(require 'mad-utils)

(use-package org-plus-contrib
  :ryo
  ("SPC o" (("l" org-store-link)
            ("c" org-capture)
            ("a" org-agenda)))
  (:mode 'org-mode)
  ("N" org-shiftright)
  ("D" org-shiftleft)
  ("T" org-shiftup)
  ("H" org-shiftdown)
  ("C-S-n" org-shiftcontrolright)
  ("C-S-d" org-shiftcontrolleft)
  ("C-S-t" org-shiftcontrolup)
  ("C-S-h" org-shiftcontroldown)
  ("M-n" org-demote-subtree)
  ("M-d" org-promote-subtree)
  ("M-t" org-move-subtree-up)
  ("M-h" org-move-subtree-down)
  ("SPC" (("!" org-time-stamp-inactive)))
  :config
  (require 'ol-notmuch)
  ;; Stop org-mode from highjacking shift-cursor keys.
  (setq org-replace-disputed-keys t)

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

(use-package org-roam
  :ensure t
  :delight
  :hook (after-init . org-roam-mode)
  :config
  (setq
   ;; Make roam recognize everithing under ~/org
   org-roam-directory "~/org"
   ;; But create new entries under ~/org/roam
   org-roam-capture-templates '(("d" "default" plain #'org-roam-capture--get-point
                                 "%?"
                                 :file-name "roam/%<%Y%m%d%H%M%S>-${slug}"
                                 :head "#+title: ${title}\n"
                                 :unnarrowed t))
   ;; Put dailies under ~/org/dailies
   org-roam-dailies-capture-templates '(("d" "daily" plain (function org-roam-capture--get-point) ""
                                         :immediate-finish t
                                         :file-name "dailies/%<%Y-%m-%d>"
                                         :head "#+TITLE: %<%Y-%m-%d>"))
   ;; Treat directory hierarchy as tags
   org-roam-tag-sources '(prop all-directories))
  (defalias 'mad-roam
    (ε #'org-roam))
  :ryo
  ("SPC o" (("r" mad-roam)
            ("f" org-roam-find-file)
            ("g" org-roam-graph-show)))
  (:mode 'org-mode)
  ("SPC o" (("i" org-roam-insert)
            ("I" org-roam-insert-immediate))))

(provide 'mad-org)
;;; mad-org.el ends here
