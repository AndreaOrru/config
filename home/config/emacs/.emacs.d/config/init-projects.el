;; -*- lexical-binding: t -*-

;; Enable Projectile.
(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)
;; Faster file searching.
(after 'projectile
  (setq projectile-enable-caching t))

;; Use FZF for file searching.
(require-package 'fzf)
(after 'fzf-projectile
  (setq fzf/args (concat fzf/args " --exact")))
(defun my/fzf-projectile ()
  "Starts an fzf session at the root of the current projectile project."
  (interactive)
  (require 'fzf)
  (require 'projectile)
  (fzf-with-command "fdfind --strip-cwd-prefix -H"
                    'fzf/action-find-file
                    (projectile-project-root)))

(defun edit-dotemacs ()
  "Open the directory of the current Emacs configuration."
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
  (define-key projectile-command-map (kbd "f") 'my/fzf-projectile)
  (define-key projectile-command-map (kbd "F") 'projectile-find-file))

(provide 'init-projects)
