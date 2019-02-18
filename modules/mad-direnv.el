;;; modules/mad-direnv.el -- enable direnv -*- lexical-binding: t; -*-
;;; Commentary:

;; Delegate setting path to direnv mode,
;; which will in turn use mostly nix shell.

;;; Code:

(require 'mad-core)

(use-package "direnv"
  :delight)

(provide 'mad-direnv)
;;; mad-direnv.el ends here
