;;; modules/mad-leger.el -- (h)ledger accounting -*- lexical-binding: t; -*-

;;; Commentary

;; Since I use only hledger variant I won't really bother with others.

;;; Code:

(require 'mad-core)
(require 'mad-completion)

(use-package hledger-mode
  :mode "\\.journal$"
  :commands hledger-enable-reporting
  :config
  (add-to-list 'company-backends 'hledger-company)
  ;; :preface
  ;; (defun hledger/next-entry ()
  ;;   "Move to next entry and pulse."
  ;;   (interactive)
  ;;   (hledger-next-or-new-entry)
  ;;   (hledger-pulse-momentary-current-entry))

  ;; (defface hledger-warning-face
  ;;   '((((background dark))
  ;;      :background "Red" :foreground "White")
  ;;     (((background light))
  ;;      :background "Red" :foreground "White")
  ;;     (t :inverse-video t))
  ;;   "Face for warning"
  ;;   :group 'hledger)

  ;; (defun hledger/prev-entry ()
  ;;   "Move to last entry and pulse."
  ;;   (interactive)
  ;;   (hledger-backward-entry)
  ;;   (hledger-pulse-momentary-current-entry))

  ;; :ryo
  ;; ("SPC f" (("j"  hledger-run-command))
  ;;  (:mode 'hledger-mode)
  ;;  ("u" . hledger-jentry)
  ;;  ("c" . hledger/prev-entry)
  ;;  ("g" . hledger/next-entry)))
)
(provide 'mad-ledger)
;;; mad-ledger.el ends here
