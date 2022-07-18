;; -*- lexical-binding: t -*-

;; Enable Projectile.
(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)
;; Faster file searching.
(after 'projectile
  (setq projectile-enable-caching t))

;; Enable integration with Helm.
(require-package 'helm-projectile)
(add-hook 'after-init-hook 'helm-projectile-on)

(defun edit-dotemacs ()
  "Open the directory of the current Emacs configuration."
  (interactive)
  (find-file (expand-file-name "config" user-emacs-directory)))

;; Use fzf for file searching.
(require-package 'fzf)
(require 'fzf)
(require 'projectile)

;; Disable fuzzy finding.
(after 'fzf-projectile
  (setq fzf/args (concat fzf/args " --exact")))

(defun my/pop-fzf-to-buffer (&rest args)
  "Pop the fzf buffer."
  (pop-to-buffer fzf/buffer-name))

(defun my/fzf-projectile ()
  "Starts an fzf session at the root of the current projectile project."
  (interactive)
  ;; Open the fzf buffer at the bottom of the frame (see init-windows.el).
  (advice-add 'split-window-vertically :override 'ignore)  ; Don't split windows.
  (advice-add 'switch-to-buffer :override 'ignore)         ; Don't switch to the fzf buffer.
  (advice-add 'make-term :before 'my/fzf-projectile--pop)  ; Pop the fzf buffer instead.
  (fzf-with-command "fd --strip-cwd-prefix -H"
                    'fzf/action-find-file
                    (projectile-project-root))
  (advice-remove 'split-window-vertically 'ignore)
  (advice-remove 'switch-to-buffer 'ignore)
  (advice-remove 'make-term 'my/fzf-projectile--pop))

;; Key bindings.
(after [evil-leader init-help projectile]
  (evil-leader/set-key "fd" 'edit-dotemacs)

  (which-key/describe-prefix "p" "projects")
  (evil-leader/set-key "p" 'projectile-command-map)
  (define-key projectile-command-map (kbd "f") 'my/fzf-projectile)
  (define-key projectile-command-map (kbd "F") 'projectile-find-file))

(provide 'init-projects)
