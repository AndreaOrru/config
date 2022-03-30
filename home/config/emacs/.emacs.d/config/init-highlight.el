;; -*- lexical-binding: t -*-

;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)

;; Highlight TODOs, HACKs, etc.
(require-package 'hl-todo)
(add-hook 'after-init-hook 'global-hl-todo-mode)

;; Key bindings.
(after 'evil-leader
  (evil-leader/set-key "sc" 'evil-ex-nohighlight))

(provide 'init-highlight)
