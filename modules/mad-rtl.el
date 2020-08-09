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

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "vlsp")
                  :major-modes '(verilog-mode)
                  :server-id 'vlsp))

(provide 'mad-rtl)
;;; mad-rtl.el ends here
