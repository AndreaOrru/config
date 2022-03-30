;; -*- lexical-binding: t -*-

;; Install Magit.
(require-package 'magit)
;; Follow symlinks in Git repositories.
(setq vc-follow-symlinks t)

;; Enable diff-hl for Git diff in the fringe.
(require-package 'diff-hl)
(add-hook 'after-init-hook 'global-diff-hl-mode)
;; Show diff-hl in the margin in terminal.
(add-hook 'after-init-hook 'diff-hl-margin-mode)
;; Magit hooks.
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; Key bindings.
(after [evil-leader init-help]
  (which-key/describe-prefix "g" "git")
  (evil-leader/set-key "gb" 'magit-blame-addition)
  (evil-leader/set-key "gd" 'magit-diff-buffer-file)
  (evil-leader/set-key "gD" 'magit-diff-working-tree)
  (evil-leader/set-key "gl" 'magit-log-all)
  (evil-leader/set-key "gs" 'magit-status)

  (evil-global-set-key 'normal (kbd "]g") 'diff-hl-next-hunk)
  (evil-global-set-key 'normal (kbd "[g") 'diff-hl-previous-hunk)
  (evil-leader/set-key "u" 'diff-hl-revert-hunk))

(provide 'init-git)
