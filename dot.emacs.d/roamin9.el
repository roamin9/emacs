;; Main control config file

(add-to-list 'load-path "~/.emacs.d/vendor")

(add-to-list 'load-path "~/.emacs.d/roamin9")

(load "roamin9/global")
(load "roamin9/keybinding")
(load "roamin9/theme")
(load "roamin9/fonts")
(load "roamin9/buffers")

;; python
(load "roamin9/python")

;; SA
(load "roamin9/SA")