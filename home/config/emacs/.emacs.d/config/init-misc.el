;; -*- lexical-binding: t -*-

;; Launch inferior shells on a lightweight shell.
(setq shell-file-name "/bin/sh")

(require-package 'auto-package-update)  ;; Utility to update packages.
(setq disabled-command-function nil)    ;; Enable all functions.

;; Make clipboard work in TTY Emacs.
(require-package 'clipetty)
(add-hook 'after-init-hook 'global-clipetty-mode)

;; Customize Emacs variables.
(after 'init-evil
  (which-key/describe-prefix "s" "search/selection/set")
  (evil-leader/set-key "sv" 'set-variable))

(provide 'init-misc)
