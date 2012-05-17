;; python设置

;; python-mode
(add-to-list 'load-path "~/.emacs.d/vendor/python-mode/")
(setq py-install-directory "~/.emacs.d/vendor/python-mode/")
(require 'python-mode)
(setq py-shell-name "ipython")

(defun my-python-mode-hook ()
  ;; (local-unset-key (kbd "<F10>"))
  (define-key python-mode-map (kbd "<f10>") 'py-execute-region-ipython)
  (define-key python-mode-map (kbd "C-c C-c") 'py-execute-buffer-ipython)
)

(add-hook 'python-mode-hook 'my-python-mode-hook)


;; yasnippet
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet/")
(require 'yasnippet)
(yas/global-mode 1)
  ;; 自己的snippets ~/.emacs.d/roamin9/snippets
(setq yas/snippet-dirs "~/.emacs.d/roamin9/snippets")