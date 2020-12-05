;;; modules/mad-rtl.el --- Real men stuff -*- lexical-binding: t; -*-
;;; Commentary:

;; Trivial config.

;;; Code:

(require 'mad-core)
(require 'mad-lsp)

(use-package firrtl-mode
  :mode "\\.fir$"
  :mode "\\.firrtl$")

(use-package verilog-mode
  :mode "\\.[ds]?vh?$"
  :hook (verilog-mode . mad-lsp))


(provide 'mad-rtl)
;;; mad-rtl.el ends here
