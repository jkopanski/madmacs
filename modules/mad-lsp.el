;;; modules/mad-lsp.el --- Language Server Protocol support -*- lexical-binding: t; -*-

;;; Commentary:

;; Basic support for lsp.
;; More complicated stuff is done in specific language settings.

;;; Code:

(require 'mad-package)
(require 'mad-direnv)
(require 'mad-flycheck)

(defun mad-lsp ()
  "Try setting up environment before starting LSP server."
  (direnv-update-environment)
  (lsp))

(use-package "lsp-mode"
  :commands lsp
  :delight
  :init
  (setq lsp-auto-guess-root    t   ;; Automatically guess the project root using projectile/project.)
        lsp-prefer-flymake     nil ;; If you prefer flycheck and lsp-ui-flycheck is available, (setq lsp-prefer-flymake nil)
        lsp-enable-indentation t)) ;; Indent regions using the file formatting functionality provided by the language server

(use-package "company-lsp"
  :commands company-lsp)

(use-package "lsp-ui"
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :bind (([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
	 ([remap xref-find-references] . #'lsp-ui-peek-find-references)))

(provide 'mad-lsp)
;;; mad-lsp.el ends here
