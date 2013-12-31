
;; All patches welcome
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-jedi_suit/emacs-jedi")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-jedi_suit/ctable")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-jedi_suit/deferred")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-jedi_suit/epc")
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

(provide 'python_conf)