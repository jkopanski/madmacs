;;; modules/mad-lsp.el --- Language Server Protocol support -*- lexical-binding: t; -*-

;;; Commentary:

;; Basic support for lsp.
;; More complicated stuff is done in specific language settings.

;;; Code:

(require 'mad-completion)
(require 'mad-direnv)
(require 'mad-flycheck)
(require 'mad-package)
(require 'mad-utils)

(defun mad-lsp ()
  "Try setting up environment before starting LSP server."
  (direnv-update-environment)
  (lsp))

(use-package lsp-mode
  :delight
  :ryo
  ("SPC c" "M-l" :name "lsp commands")
  :init
  (setq
   ;; Automatically guess the project root using projectile/project.)
   lsp-auto-guess-root t
   ;; Indent regions using the file formatting functionality provided by the language server
   lsp-enable-indentation t
   ;; Watch even large number of files
   lsp-enable-file-watchers t
   ;; If you prefer flycheck and lsp-ui-flycheck is available, (setq lsp-prefer-flymake nil)
   lsp-prefer-flymake nil
   ;; I don't have yasnippet installed
   lsp-enable-snippet nil
   ;; HACK: cause of trouble with setting ryo to emit `s-l' I need to set matching prefix
   lsp-keymap-prefix "M-l"
   )
  :config
  (defalias 'mad-lsp-command-map
    (ε #'lsp-command-map))
  (add-to-list 'lsp-file-watch-ignored "[/\\\]dist-newstyle$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\]result.*")

  ;; missing glyph in my font
  (setq lsp-headerline-arrow ">")

  ;; verilog support
  ;; (setq lsp-log-io 't)
  (add-to-list 'lsp-language-id-configuration '(verilog-mode . "verilog"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "verilog-language-server")
                    :major-modes '(verilog-mode)
                    :server-id 'verilog-language-server))
  )

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :bind (([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . #'lsp-ui-peek-find-references))

  :config
  (setq lsp-ui-doc-position 'top
        lsp-ui-doc-alignment 'frame
        lsp-ui-doc-show-with-cursor 't
        lsp-ui-doc-show-with-mouse 't)
  )

(provide 'mad-lsp)
;;; mad-lsp.el ends here
