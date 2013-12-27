;;basic configure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;setq
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/lib/popup")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/lib/fuzzy")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)

(provide 'autocomplete-conf)