;; 全局设置

;;禁用启动画面
(setq inhibit-startup-message t)

;; "y or n" 代替 "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行号，列号
(setq linu-number-mode t)
(setq column-number-mode t)

;; 在 模式行 中显示时间
(display-time-mode 1)

;; 不需要滚动条
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; 不要工具栏
(tool-bar-mode -1)

;; 不要菜单栏
(menu-bar-mode -1)

;; 换行设置，line-wrapping
(set-default 'fill-column 80)

;; Mac: 把command键映射为meta键
(setq ns-command-modifier (quote meta))

