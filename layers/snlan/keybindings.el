;; set company select key to emacs mode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
(spacemacs/set-leader-keys "oll" 'snlan/load-my-layout)
(spacemacs/set-leader-keys "ols" 'snlan/save-my-layout)
