;;; modules/mad-editing.el --- Navigation and editing -*- lexical-binding: t; -*-
;;; Commentary:

;; File and directory navigation using `dired'.
;; Modal editing with modalka.

;;; Code:

(require 'mad-core)

(setq
 dired-auto-revert-buffer   t
 dired-clean-up-buffers-too t
 dired-dwim-target          t
 dired-keep-marker-copy     nil
 dired-keep-marker-rename   nil
 dired-listing-switches     "-GAlh --group-directories-first"
 dired-recursive-copies     'always
 dired-recursive-deletes    'always)

(defun mad--insert-mode-after-f (&optional fnc)
  "Go to insert mode after executing FNC."
  (when (fboundp fnc)
    (funcall fnc))
  (modalka-mode -1))

(defun mad--newline ()
  "Insert newline below cursor."
  (end-of-line)
  (newline-and-indent))

(defalias 'mad-insert-after   (ε #'mad--insert-mode-after-f #'forward-char))
(defalias 'mad-insert-here    (ε #'mad--insert-mode-after-f))
(defalias 'mad-insert-newline (ε #'mad--insert-mode-after-f #'mad--newline))

(setq-default cursor-type '(bar . 1))
(use-package "modalka"
  :commands (modalka-define-kbd modalka-mode modalka-global-mode)
  :bind (("C-<return>" . #'modalka-mode)
	 :map modalka-mode-map
	 ("a" . #'mad-insert-after)
	 ("i" . #'mad-insert-here)
	 ("o" . #'mad-insert-newline))
  :init
  (modalka-global-mode 1)
  :config
  (setq modalka-cursor-type 'box)
  ;; dvorak home row navigation
  (modalka-define-kbd "n" "C-f")
  (modalka-define-kbd "d" "C-b")
  (modalka-define-kbd "h" "C-n")
  (modalka-define-kbd "t" "C-p")
  (modalka-define-kbd "^" "C-a") ;; beggining of line
  (modalka-define-kbd "$" "C-e") ;; end of line
  (modalka-define-kbd "e" "M-f") ;; forward one word
  (modalka-define-kbd "b" "M-b") ;; back one word
  (modalka-define-kbd "(" "M-a") ;; previous sentence
  (modalka-define-kbd ")" "M-e") ;; next sentence
  (modalka-define-kbd "{" "M-v") ;; previous screen
  (modalka-define-kbd "}" "C-v") ;; next screen
  (modalka-define-kbd "g g" "M-<") ;; beggining of buffer
  (modalka-define-kbd "G" "M->") ;; end of buffer
  )

(provide 'mad-editing)
;;; mad-editing.el ends here
