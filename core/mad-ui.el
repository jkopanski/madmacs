;;; core/mad-ui.el --- Basic UI settings -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(setq-default frame-title-format '("Madmacs"))
(global-eldoc-mode -1)

(when (fboundp 'tooltip-mode)    (tooltip-mode    -1))
(when (fboundp 'menu-bar-mode)   (menu-bar-mode   -1))
(when (fboundp 'tool-bar-mode)   (tool-bar-mode   -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(provide 'ui)

;;; mad-ui.el ends here
