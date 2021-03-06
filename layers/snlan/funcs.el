(defun counsel-goto-recent-directory ()
  "Recent directories"
  (interactive)
  (unless recentf-mode (recentf-mode 1))
  (let ((collection
         (delete-dups
          (append (mapcar 'file-name-directory recentf-list)
                  ;; fasd history
                  (if (executable-find "fasd")
                      (split-string (shell-command-to-string "fasd -ld") "\n" t))))))
    (ivy-read "directories:" collection
              :action 'dired
              :caller 'counsel-goto-recent-directory)))

(defun counsel-find-file-recent-directory ()
  "Find file in recent git repository."
  (interactive)
  (unless recentf-mode (recentf-mode 1))
  (let ((collection
         (delete-dups
          (append (mapcar 'file-name-directory recentf-list)
                  ;; fasd history
                  (if (executable-find "fasd")
                      (split-string (shell-command-to-string "fasd -ld") "\n" t))))))
    (ivy-read "directories:" collection
              :action 'my-find-file-in-git-repo
              :caller 'counsel-find-file-recent-directory)))

(defun snlan/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "mylayout")))

(defun snlan/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "mylayout")))

(defun snlan/git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))

(defun snlan/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (snlan/git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (counsel-file-jump))))
