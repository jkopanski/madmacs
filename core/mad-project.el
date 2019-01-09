;;; core/mad-project.el --- Project management -*- lexical-binding: t; -*-

;;; Commentary:

;; Install and use projectile

;;; Code:

(require 'mad-package)

(use-package "projectile"
  :demand t
  :commands projectile-global-mode
  :config
  (projectile-global-mode))

(provide 'mad-project)
;;; mad-project.el ends here
