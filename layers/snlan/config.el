;; 回车缩进
(defun disable-aindent()
  (clean-aindent-mode -1))
(add-hook 'go-mode-hook 'disable-aindent)
