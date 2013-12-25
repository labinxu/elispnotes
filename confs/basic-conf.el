;;basic configure
(setq user-full-name "Labin.xu") 
(setq user-mail-address "flowinair@gmail.com") 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;setq
(setq-default cursor-type 'bar)
(setq make-backup-files -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq show-paren-style 'parenthesis)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-fill-column 80)
;; tab and comments
(setq-default tab-width 4)
(setq-default comment-column 40)        ; [C-x ;] (set-comment-column)
(setq mouse-drag-copy-region nil);;取消鼠标选择即复制
(setq x-select-enable-clipboard t);;支持emacs和外部程序的粘贴
(setq backup-inhibited t);;不产生备份 
(setq auto-save-default nil);不生成名为#filename# 的临时文件
;;;
(global-font-lock-mode t);语法高亮 
(setq font-lock-maximum-decoration t) 
(setq font-lock-global-modes '(not shell-mode text-mode)) 
(setq font-lock-verbose t) 
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000))) 

;;align automate
(require 'align) 
(global-set-key "\C-j" 'align) 
(setq track-eol t);; 当光标在行尾上下移动的时候，始终保持在行尾。 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; frame ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f11] 'delete-other-windows);F11 关闭其它窗口 
(global-set-key (kbd "C-|") 'other-window);窗口间跳转

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; frame ;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode t)
(global-linum-mode t)
(global-font-lock-mode t)
;;(desktop-save-mode 1)
(auto-save-mode nil);;禁止自动保存
(transient-mark-mode t);允许临时设置标记 
;;;;;;;;;;;;;;;;;;

;;ido mode
(when (fboundp 'ido-mode)
  (ido-mode t)
  (ido-everywhere t)                    ; For GUI
  (setq ido-use-filename-at-point 'guess
        ido-use-url-at-point t))

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'icomplete-mode) (icomplete-mode t));;用M-x执行某个命令的时候，在输入的同时给出可选的命令名提示 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun find-dotemacs-file ()
  "Open .emacs file"
  (interactive)
  (let* ((paths '("~/.emacs" "~/.emacs.el" "~/.emacs.d/init.el" "~/_emacs"))
         (dotemacs-path))
    (dolist (path paths)
      (and (not dotemacs-path)
           (file-exists-p path)
           (setq dotemacs-path path)))
    (find-file (or dotemacs-path
                   (locate-file "site-start.el" load-path)
                   "~/.emacs"))))
                   
(defun move-line-up (p)
  "Move current line up, copy from crazycool@smth"
  (interactive "*p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (previous-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))
    
(defun move-line-down (p)
  "Move current line down, copy from crazycool@smth"
  (interactive "*p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (next-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))
    
;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。 
(defun my-common-mode-auto-pair () 
    (interactive) 
    (make-local-variable 'skeleton-pair-alist) 
    (setq skeleton-pair-alist '( 
        (? ? _ "''") 
        (? ? _ """") 
        (? ? _ "()") 
        (? ? _ "[]") 
        (?{ _ ?} >))) 
    (setq skeleton-pair t) 
    (local-set-key (kbd "(") 'skeleton-pair-insert-maybe) 
    (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe) 
    (local-set-key (kbd "{") 'skeleton-pair-insert-maybe) 
    (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe) 
    (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
    
(add-hook 'python-mode-hook 'my-common-mode-auto-pair)
(add-hook 'c-mode-hook 'my-common-mode-auto-pair) 
(add-hook 'c++-mode-hook 'my-common-mode-auto-pair)
(add-hook 'lisp-mode-hook 'my-common-mode-auto-pair)
(add-hook 'emacs-lisp-mode-hook 'my-common-mode-auto-pair)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'buildin-cedet-conf)
(provide 'basic-conf)