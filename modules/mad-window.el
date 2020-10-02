;;; core/mad-window.el --- Window navigation -*- lexical-binding: t; -*-
;;; Commentary:

;; Splitting, deleting and navigating windows

;;; Code:

(require 'mad-core)

(use-package ace-window
  :config
  (defalias 'mad-split-window-fair
    (ε #'aw-split-window-fair (selected-window)))
  (defalias 'mad-split-window-vert
    (ε #'aw-split-window-vert (selected-window)))
  (defalias 'mad-split-window-horiz
    (ε #'aw-split-window-horiz (selected-window)))
  (setq aw-keys '(?a ?o ?e ?u ?h ?t ?t ?s ?i ?d))
  :ryo
  (:norepeat t)
  ("m" ace-window)
  ("SPC m"
   (("h" mad-split-window-fair :name "split fair")
    ("t" mad-split-window-vert :name "split vert")
    ("n" mad-split-window-horiz :name "split horiz")
    ("k" delete-window :name "delete window")
    ("x" delete-other-windows :name "delete other windows")
    )
  ))

(provide 'mad-window)
;;; mad-window.el ends here
