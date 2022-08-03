;; -*- lexical-binding: t -*-

(require-package 'rustic)

(after [lsp-mode rustic]
  ;; Add Cargo binaries to the PATH.
  (setq exec-path (cons (expand-file-name "~/.cargo/bin") exec-path))
  ;; Use clippy for diagnostics.
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  ;; Format on save, but don't show errors.
  (setq rustic-format-trigger 'on-save)
  (setq rustic-format-display-method 'ignore))

(provide 'init-rust)
