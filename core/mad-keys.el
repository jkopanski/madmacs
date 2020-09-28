;;; core/mad-keys.el --- Modal editing and navigation -*- lexical-binding: t; -*-
;;; Commentary:

;; The idea is as follows:
;; * use `modalka' to implement modal editing
;;   by assigning standard Emacs keys
;; * do mapping of keys to default ones

;;; Code:

(require 'mad-package)
(require 'mad-utils)

(require 'dired-x)
(setq dired-auto-revert-buffer   t
      dired-clean-up-buffers-too t
      dired-dwim-target          t
      dired-keep-marker-copy     nil
      dired-keep-marker-rename   nil
      dired-listing-switches     "-Galh --group-directories-first"
      dired-recursive-copies     'always
      dired-recursive-deletes    'always)

(use-package which-key
  :delight
  :init
  (setq which-key-separator " "
        which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

(defun mad-newline ()
  "Insert newline below cursor."
  (end-of-line)
  (newline-and-indent))

;; Default cursor for input mode
(setq-default cursor-type '(bar . 1))

(use-package ryo-modal
  :delight
  :commands ryo-modal-mode
  :bind ("C-u" . ryo-modal-mode)
  :hook ((dired-mode . ryo-modal-mode)
         (prog-mode . ryo-modal-mode)
         (org-mode . ryo-modal-mode)
         (text-mode . ryo-modal-mode))
  :config
  (setq ryo-modal-cursor-type 'box
        ryo-modal-cursor-color nil)
  ;; right hand
  ;; home row + 1
  (ryo-modal-keys
   ("f" beginning-of-line)
   ("g" backward-word)
   ("c" forward-word)
   ("r" end-of-line)
   ;; ("l" todo)
   ;; ("/" todo)
   )
  ;; home row
  (ryo-modal-keys
   ("d" backward-char)
   ("h" next-line)
   ("t" previous-line)
   ("n" forward-char)
   ;; ("s" todo)
   ;; ("-" todo)
   )
  ;; home row - 1
  (ryo-modal-keys
   ("b" isearch-forward)
   ("m" other-window)
   ;; ("w" "")
   ;; ("v" "")
   ;; ("z" "")
   ;; ("\" "")
   )
  ;; left hand
  ;; home row + 1
  (ryo-modal-keys
   ;; ("`" todo)
   ("'" indent-region)
   ;; ("," todo)
   ("." "C-<backspace>") ;; 'backward-kill-word
   ("p" "M-d") ;; 'kill-word
   )
  ;; home row
  (ryo-modal-keys
   ;; ("<prior>" todo)
   ("a" "M-x")
   ("o" mad-newline :exit t)
   ("e" undo)
   ("u" ryo-modal-mode)
   ("i" forward-char :exit t)
   ;; ("<tab>" todo)
   )
  ;; home row - 1
  (ryo-modal-keys
   ;; ("<next>" todo)
   (";" comment-dwim)
   ("q" kill-region)
   ("j" kill-ring-save)
   ("k" yank)
   ;; ("X" "")
   )
  )

(provide 'mad-keys)
;;; mad-keys.el ends here
