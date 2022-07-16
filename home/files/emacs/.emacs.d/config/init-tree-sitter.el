;; -*- lexical-binding: t -*-

(require-package 'tree-sitter)
(require-package 'tree-sitter-langs)

;; Enable tree-sitter syntax highlighting everywhere.
(add-hook 'after-init-hook 'global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)

(provide 'init-tree-sitter)
