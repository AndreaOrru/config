;; -*- lexical-binding: t -*-

;; Enable Projectile.
(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)
;; Faster file searching.
(after 'projectile
  (setq projectile-enable-caching t))

;; Use FZF for file searching.
(require-package 'fzf)

(defun edit-dotemacs ()
  "Open the directory of the current Emacs configuration"
  (interactive)
  (find-file (expand-file-name "config" user-emacs-directory)))

;; Enable integration with Helm.
(require-package 'helm-projectile)
(add-hook 'after-init-hook 'helm-projectile-on)

;; Key bindings.
(after [evil-leader init-help projectile]
  (evil-leader/set-key "fd" 'edit-dotemacs)

  (which-key/describe-prefix "p" "projects")
  (evil-leader/set-key "p" 'projectile-command-map)
  (define-key projectile-command-map (kbd "f") 'fzf-projectile)
  (define-key projectile-command-map (kbd "F") 'projectile-find-file))

(provide 'init-projects)
