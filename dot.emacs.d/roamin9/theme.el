;; 颜色主题

(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(color-theme-initialize)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-solarized-dark)
;; (load-file "~/.emacs.d/vendor/color-theme/themes/color-theme-zenburn.el")
;; (color-theme-zenburn)