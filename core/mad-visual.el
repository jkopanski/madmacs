;;; core/mad-visual.el --- Eye candy -*- lexical-binding: t; -*-
;;; Commentary:

;; Hopefully one day I could switch easily between light and dark.
;; For now I'll just install one theme.

;; Some themes with dark/light variants:
;; * solarized
;; * moe https://emacsthemes.com/themes/moe-theme.html
;; * material https://emacsthemes.com/themes/material-theme.html
;; * gruvbox https://emacsthemes.com/themes/gruvbox-theme.html

;;; Code:

(require 'mad-package)

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material))

(provide 'mad-visual)

;;; mad-visual.el ends here
