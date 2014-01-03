(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'tabbar)
(tabbar-mode t)
(global-set-key [M-left] (quote tabbar-backward))
(global-set-key [M-right] (quote tabbar-forward))
(set-face-attribute 'tabbar-default nil
                    :family "Consolas"
                    :background "gray80"
                    :foreground "gray30"
                    :height 1.0
                    )
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray30")
                    )
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    ;; :overline "black"
                    ;; :underline "black"
                    :weight 'bold
                    )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "gray70")
                    )
(provide 'tabbar-conf)