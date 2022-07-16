;; -*- lexical-binding: t -*-

;; Sane defaults.
(setq-default
 auto-save-default nil         ;; Don't auto save files.
 column-number-mode t          ;; Show column number in modeline.
 create-lockfiles nil          ;; Don't create # lock files.
 indent-tabs-mode nil          ;; Use spaces for indentation.
 make-backup-files nil         ;; Don't create ~ backup files.
 require-final-newline 'visit  ;; Require newline at end of file.
 tab-width 4)                  ;; Show tabs as 4 spaces.

(add-hook 'after-init-hook 'electric-pair-mode)   ;; Insert parens in pairs.
(add-hook 'after-init-hook 'global-subword-mode)  ;; CamelCase words.

;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)
;; Enable line numbers in programming buffers.
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Intelligently clean up extra whitespaces on save.
(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)

;; Utilities for (un-)commenting.
(require-package 'evil-nerd-commenter)

;; Key bindings.
(after 'evil-leader
  ;; Indent a region.
  (evil-define-key 'visual prog-mode-map (kbd "TAB") 'indent-region)
  ;; Comment/uncomment.
  (require 'evil-nerd-commenter)
  (evil-leader/set-key ";" 'evilnc-comment-operator))

(provide 'init-editing)
