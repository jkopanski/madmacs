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

(use-package "which-key"
  :delight
  :init
  (setq which-key-separator " "
        which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

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
  :delight
  :bind ( ("<end>" . #'modalka-mode)
          :map modalka-mode-map
          ("a" . #'mad-insert-after)
          ("o" . #'mad-insert-newline)
          ("u" . #'mad-insert-here)

          ;; ("h" . #'next-line)
          ;; ("t" . #'previous-line)
          ;; ("n" . #'forward-char)
        )
  :init
  (modalka-global-mode 1)
  :config
  (setq modalka-cursor-type 'box)
  ;; right hand
  ;; home row + 1
  (modalka-define-kbd "f" "C-a") ;; 'beginning-of-line
  (modalka-define-kbd "g" "M-b") ;; 'backward-word
  (modalka-define-kbd "c" "M-f") ;; 'forward-word
  (modalka-define-kbd "r" "C-e") ;; 'end-of-line
  (modalka-define-kbd "l" "") ;; NOT YET
  (modalka-define-kbd "-" "") ;; NOT YET
  ;; home row
  (modalka-define-kbd "d" "C-b") ;; 'backward-char
  (modalka-define-kbd "h" "C-n") ;; 'next-line
  (modalka-define-kbd "t" "C-p") ;; 'previous-line
  (modalka-define-kbd "n" "C-f") ;; 'forward-char
  (modalka-define-kbd "s" "") ;; NOT YET
  (modalka-define-kbd "/" "") ;; NOT YET
  ;; home row - 1
  (modalka-define-kbd "b" "C-s") ;; 'isearch-forward
  (modalka-define-kbd "m" "") ;; NOT YET
  (modalka-define-kbd "w" "") ;; NOT YET
  (modalka-define-kbd "v" "") ;; NOT YET
  (modalka-define-kbd "z" "") ;; NOT YET
  (modalka-define-kbd ")" "") ;; NOT YET
  ;; left hand
  ;; home row + 1
  ;; (modalka-define-kbd "<tab>" "") ;; NOT YET
  (modalka-define-kbd "'" "") ;; NOT YET
  (modalka-define-kbd "," "") ;; NOT YET
  (modalka-define-kbd "." "C-<backspace>") ;; 'backward-kill-word
  (modalka-define-kbd "p" "M-d") ;; 'kill-word
  (modalka-define-kbd "y" "") ;; NOT YET
  ;; home row
  ;; (modalka-define-kbd "" "") ;; no key yet on my layout
  ;; (modalka-define-kbd "a" "") ;; NOT YET
  ;; (modalka-define-kbd "o" "") ;; NOT YET
  (modalka-define-kbd "e" "C-/") ;; 'undo
  ;; (modalka-define-kbd "u" "") ;; NOT YET
  (modalka-define-kbd "i" "") ;; NOT YET
  ;; home row - 1
  (modalka-define-kbd "(" "") ;; NOT YET
  (modalka-define-kbd ";" "") ;; NOT YET
  (modalka-define-kbd "q" "C-w") ;; 'kill-region
  (modalka-define-kbd "j" "M-w") ;; 'kill-ring-save
  (modalka-define-kbd "k" "C-y") ;; 'yank
  (modalka-define-kbd "x" "") ;; NOT YET
  )

(provide 'mad-keys)
;;; mad-keys.el ends here
