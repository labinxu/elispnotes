;; ****************************************************************************
;; Jump to point
;; ****************************************************************************

(global-set-key [(shift f1)] '(lambda ()
				(interactive)
				(point-to-register 1)))


(global-set-key [(shift f2)] '(lambda ()
				(interactive)
				(point-to-register 2)))


(global-set-key [(shift f3)] '(lambda ()
				(interactive)
				(point-to-register 3)))


(global-set-key [(shift f4)] '(lambda ()
				(interactive)
				(point-to-register 4)))



(global-set-key [(control f1)] '(lambda ()
				  (interactive)
				  (jump-to-register 1)))


(global-set-key [(control f2)] '(lambda ()
				  (interactive)
				  (jump-to-register 2)))


(global-set-key [(control f3)] '(lambda ()
				  (interactive)
				  (jump-to-register 3)))


(global-set-key [(control f4)] '(lambda ()
				  (interactive)
				  (jump-to-register 4)))
(provide 'my-jump)