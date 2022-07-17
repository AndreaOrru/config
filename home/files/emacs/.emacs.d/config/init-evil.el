;; -*- lexical-binding: t -*-

;; Use Evil mode for Vim emulation.
(require-package 'evil)
(add-hook 'after-init-hook 'evil-mode)

;; Use undo-tree as the undo system.
(require-package 'undo-tree)
(add-hook 'after-init-hook 'global-undo-tree-mode)
(after 'evil
  (evil-set-undo-system 'undo-tree))

;; Collection of extra Evil key bindings.
(require-package 'evil-collection)
(setq evil-want-keybinding nil)
(after 'evil
  (evil-collection-init))

;; General Evil options.
(setq
 evil-ex-substitute-global t      ; Substitute globally by default.
 evil-search-module 'evil-search  ; Vim-like search with persistent highlight.
 evil-symbol-word-search t        ; * and # search for symbols.
 evil-want-C-u-scroll t)          ; C-u to scroll up.

;; Use Space as leader key.
(require-package 'evil-leader)
(add-hook 'after-init-hook 'global-evil-leader-mode)
(after 'evil-leader
  (evil-leader/set-leader "SPC"))

;; Use `s` for surround.
(require-package 'evil-surround)
(add-hook 'after-init-hook 'global-evil-surround-mode)
(after 'evil-surround
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region))

;; Jump to definition in another window.
(after 'evil
  (define-key evil-motion-state-map "gD" 'xref-find-definitions-other-window))

;; Show current and total search matches in modeline.
(require-package 'evil-anzu)
(add-hook 'after-init-hook 'global-anzu-mode)
(after 'evil
  (require 'evil-anzu))

(provide 'init-evil)
