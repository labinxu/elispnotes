;;yasnippet configure
;;load file
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")


(require 'yasnippet)
(yas/global-mode t)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

(provide 'yasnippet-conf)