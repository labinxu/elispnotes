;;basic configure

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;setq
(setq-default cursor-type 'bar)
(setq make-backup-files -1)
(fset 'yes-or-no-p 'y-or-n-p) ; y/n instead of yes/no

;;;;;;;;;;;;;;;;;;
;;(desktop-save-mode 1)

;;;;global setting
(global-linum-mode t)
(global-font-lock-mode t)
(show-paren-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tab and comments
(setq-default tab-width 4)
(setq-default comment-column 40)        ; [C-x ;] (set-comment-column)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ido mode
(when (fboundp 'ido-mode)
  (ido-mode t)
  ;; (ido-everywhere t)                    ; For GUI
  (setq ido-use-filename-at-point 'guess
        ido-use-url-at-point t))

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'icomplete-mode) (icomplete-mode t))

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
    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'buildin-cedet-conf)
(provide 'basic-conf)