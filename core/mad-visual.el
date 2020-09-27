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

(use-package delight)

(set-face-attribute 'default nil :font "mononoki" :height 130)

;; (use-package nord-theme
;;   :config
;;   (load-theme 'nord t))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-nord-light t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(setq use-package-verbose t)
(use-package smart-mode-line
  :demand t
  :commands sml/setup
  :init
  (setq sml/theme 'respectful
        sml/shorten-directory t
        sml/shorten-modes t
        sml/name-width 40
        sml/no-confirm-load-theme t
        sml/mode-width 'full)
  :config
  (sml/setup))

;; Enable built-in `display-line-numbers'
;; Requires Emacs 26.1+
;; Possible arguments are:
;; t - absolute line numbers
;; relative - relative line numbers
;; visual - relative visual line numbers
;; Not sure what the difference is between relative andvisual
(setq display-line-numbers t)
(global-display-line-numbers-mode)

;; show matching parentheses
;; with little delay that I'm used to
;; by using `doom-emacs'
(setq show-paren-delay 0.1
      show-paren-highlight-openparen t
      show-paren-when-point-inside-paren t)
(show-paren-mode)

;; shiny
(use-package all-the-icons)

(use-package smartparens)

(provide 'mad-visual)
;;; mad-visual.el ends here
