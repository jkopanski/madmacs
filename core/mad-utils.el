;;; core/mad-utils.el --- Various utils -*- lexical-binding: t; -*-
;;; Commentary:

;; Various utilities, mostlf ripped off from somewhere else

;;; Code:

(defun π (key fnc)
  "Set global key binding that binds KEY to FNC."
  (global-set-key (kbd key) fnc))

(provide 'mad-utils)
;;; mad-utils.el ends here
