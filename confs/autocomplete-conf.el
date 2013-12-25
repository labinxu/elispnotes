;;basic configure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;setq
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/tools")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/tools/ac-dict")
(ac-config-default)

(provide 'autocomplete-conf)