;;; modules/mad-mail.el --- Email -*- lexical-binding: t; -*-
;;; Commentary:

;; Email with `notmuch-emacs'

;;; Code:

(defun notmuch-file-to-group (file)
  "Calculate the Gnus group name from the given file name."
  (let ((group (file-name-directory (directory-file-name (file-name-directory file)))))
    (setq group (replace-regexp-in-string ".*/mail/" "nnimap+USER:" group))
    (setq group (replace-regexp-in-string "/$" "" group))
    (if (string-match ":$" group)
        (concat group "INBOX")
      (replace-regexp-in-string ":\\." ":" group))))

(defun notmuch-goto-message-in-gnus ()
  "Open a summary buffer containing the current notmuch article."
  (interactive)
  (unless (gnus-alive-p) (with-temp-buffer (gnus)))
  (let ((group (notmuch-file-to-group (notmuch-show-get-filename)))
        (message-id
         (replace-regexp-in-string
          "\"" ""
          (replace-regexp-in-string "^id:" ""
                                    (notmuch-show-get-message-id)))))
    (if (and group message-id)
        (progn
          (gnus-summary-read-group group 1) ; have to show at least one old message
          (gnus-summary-refer-article message-id)) ; simpler than org-gnus method?
      (message "Couldn't get relevant infos for switching to Gnus."))))

;; Use msmtp for sending email.
;; It is configured via nix home-manager
(setq send-mail-function 'sendmail-send-it
      sendmail-program "msmtp"
      mail-specify-envelope-from t
      message-sendmail-envelope-from 'header
      mail-envelope-from 'header)

;; Message mode customization
(setq message-directory "~/mail/famisoft/"
      message-auto-save-directory "~/mail/famisoft/drafts"
      mail-interactive t
      smtpmail-debug-info t
      user-full-name "Jakub Kopański"
      user-mail-address "jakub@famisoft.pl"
      message-kill-buffer-on-exit t)

(defun mapn (func arg)
  "Maybe functor"
  (if (null arg)
      nil
      (funcall func arg)))

(defmacro saved-search-entry (n q &optional k)
  `(quote (:name ,n
           :query ,(format "%s and not tag:deleted" q)
           :count-query ,(format "%s" q)
           :search-type tree
           :key ,(mapn 'kbd k))))

;; (macroexpand '(saved-search-entry "test" "q" "a"))

;; (setq tst `( ,(saved-search-entry "test" "q")
;;              ,(saved-search-entry "wrath" "a")))

(use-package notmuch
  :bind (:map notmuch-show-mode-map
              ("C-c C-c" . notmuch-goto-message-in-gnus))
  :config
  (setq
   notmuch-fcc-dirs '(("jakub@famisoft.pl" . "famisoft/sent"))
   notmuch-show-indent-messages-width 4
   notmuch-show-all-multipart/alternative-parts nil

   notmuch-search-oldest-first nil
   notmuch-search-line-faces '(("deleted" :foreground "red")
                               ("unread" :weight bold)
                               ("flagged" :foreground "blue"))

   notmuch-saved-searches `(,(saved-search-entry "inbox" "tag:inbox" "i")
                            ,(saved-search-entry "unread" "tag:unread" "u")
                            ,(saved-search-entry "flagged" "tag:flagged" "f")
                            ,(saved-search-entry "sent" "tag:sent" "t")
                            ,(saved-search-entry "drafts" "tag:draft" "t")
                             (:name "all mail" :query "*" :key ,(kbd "a"))
                            ,(saved-search-entry "hammer-dev" "tag:hammer-devel" "h"))
   ))


(use-package gnus
  :config
  (setq gnus-select-method
        '(nnmaildir "famisoft"
                    (directory "~/mail/famisoft/")
                    (directory-files nnheader-directory-files-safe)
                    (get-new-mail nil))
        user-mail-address "jakub@famisoft.pl"))

(provide 'mad-mail)
;;; mad-mail.el ends here
