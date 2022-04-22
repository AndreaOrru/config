;; -*- lexical-binding: t -*-

(require-package 'rustic)

(after [lsp-mode rustic]
  (setq exec-path (cons (expand-file-name "~/.cargo/bin") exec-path))
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq rustic-format-on-save t))

(provide 'init-rust)
