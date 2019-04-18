(add-hook 'go-mode-hook (lambda()
                          (setq indent-tabs-mode 1)
                          (setq tab-width 4)))

(defun disable-aindent()
  (clean-aindent-mode -1))
(add-hook 'go-mode-hook 'disable-aindent)
