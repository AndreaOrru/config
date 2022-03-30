;; -*- lexical-binding: t -*-

(require-package 'tree-sitter)
(require-package 'tree-sitter-langs)

(add-hook 'after-init-hook 'global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)

(provide 'init-tree-sitter)
