;; -*- lexical-binding: t -*-

(require-package 'rustic)

(after [lsp-mode rustic]
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq rustic-format-on-save t))

(provide 'init-rust)
