;;; core/mad-keys.el --- Modal editing and navigation -*- lexical-binding: t; -*-
;;; Commentary:

;; The idea is as follows:
;; * use `xah-fly-keys' for convinient navigation procedures
;; * overwrite default keybindings to use those procs
;; * use `modalka' to implement modal editing
;; * do mapping of keys to default ones

;;; Code:

(require 'mad-package)

(use-package "which-key"
  :init
  (setq which-key-separator ""
        which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

(use-package "xah-fly-keys")

(use-package "modalka"
  :bind ( ("C-<return>" . #'modalka-mode)
          :map modalka-mode-map
          ("d" . #'backward-char)
          ("h" . #'next-line)
          ("t" . #'previous-line)
          ("n" . #'forward-char)
        ))

(provide 'mad-keys)
;;; mad-keys.el ends here
