;;; modules/mad-completion.el --- Code completion features -*- lexical-binding: t; -*-
;;; Commentary:

;; Basic completion using `comapny'

;;; Code:

(require 'mad-package)

(use-package "company"
  :demand t
  :delight
  :commands company-mode
  :config
  (setq company-idle-delay nil
        company-minimum-prefix-length 2
        company-tooltip-limit 10
        company-tooltip-align-annotations t
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-code-other-buffers t
        company-require-match 'never
        company-global-modes '(not term-mode eshell-mode comint-mode erc-mode message-mode help-mode gud-mode)
        company-transformers '(company-sort-by-occurrence))

  (global-company-mode +1)

  (use-package "company-quickhelp"
    :config
    (setq company-quickhelp-delay 1)
    (company-quickhelp-mode 1)))

(provide 'mad-completion)
;;; mad-completion.el ends here
