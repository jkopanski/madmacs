;;; modules/typescript-tsx-mode.el --- Major mode for typescript with JSX -*- lexical-binging: t; -*-
;;; Commentary:

;; Basically renamed web-mode.

;;; Code:

(require 'mad-core)
(require 'mad-lsp)

(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset    2
        web-mode-code-indent-offset   2
        web-mode-block-padding        2
        web-mode-comment-style        2

        web-mode-enable-css-colorization          t
        web-mode-enable-auto-pairing              t
        web-mode-enable-comment-keywords          t
        web-mode-enable-current-element-highlight t)

  (define-derived-mode typescript-tsx-mode web-mode "typescript tsx")
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))
  (add-hook 'typescript-tsx-mode-hook #'mad-lsp)

  (with-eval-after-load "flycheck"
    (flycheck-add-mode 'typescript-tslint 'typescript-tsx-mode)
    (setq flycheck-typescript-tslint-executable "tslint")))

(provide 'typescript-tsx-mode)
;;; typescript-tsx-mode.el ends here
