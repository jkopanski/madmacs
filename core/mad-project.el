;;; core/mad-project.el --- Project management -*- lexical-binding: t; -*-

;;; Commentary:

;; Install and use projectile

;;; Code:

(require 'mad-package)

(use-package projectile
  :delight
  :demand t
  :commands projectile-global-mode
  :config
  (projectile-global-mode)
  (setq projectile-mode-line-prefix " ")
  )

(provide 'mad-project)
;;; mad-project.el ends here
