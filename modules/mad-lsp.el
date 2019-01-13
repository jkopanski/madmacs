;;; modules/mad-lsp.el --- Language Server Protocol support -*- lexical-binding: t; -*-

;;; Commentary:

;; Basic support for lsp.
;; More complicated stuff is done in specific language settings.

;;; Code:

(require 'mad-package)
(require 'mad-completion)
(require 'mad-flycheck)

(use-package "lsp-mode")

(with-eval-after-load "company"
  (use-package "company-lsp"
    :after lsp-mode
    :config
    (push 'company-lsp company-backends)))

(use-package "lsp-ui"
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(provide 'mad-lsp)
;;; mad-lsp.el ends here
