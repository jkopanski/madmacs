;;; modules/mad-rtl.el --- Real men stuff -*- lexical-binding: t; -*-
;;; Commentary:

;; Trivial config.

;;; Code:

(require 'mad-core)

(use-package "firrtl-mode"
  :mode "\\.fir$"
  :mode "\\.firrtl$")

(provide 'mad-rtl)
;;; mad-rtl.el ends here
