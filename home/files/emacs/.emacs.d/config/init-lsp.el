;; -*- lexical-binding: t -*-

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'lsp-treemacs)
(require-package 'helm-lsp)

;; Set process output to 1 MB as recommended by LSP's docs.
(setq read-process-output-max (* 1024 1024))

(after [lsp-mode evil]
  (setq
   lsp-auto-guess-root t                 ;; Guess the project's root.
   lsp-enable-snippet nil                ;; Disable Yasnippet.
   lsp-headerline-breadcrumb-enable nil  ;; Disable headerline.
   lsp-keep-workspace-alive nil          ;; Kill language server when done.
   lsp-lens-enable nil                   ;; Disable lenses.
   lsp-modeline-diagnostics-enable nil   ;; Disable LSP diagnostics counter.
   lsp-ui-doc-enable nil)                ;; Disable documentation on hover.

  ;; Setup the LSP prefix for LSP-enabled buffers.
  (setq lsp-keymap-prefix ",")
  (add-hook 'lsp-mode-hook
            #'(lambda()
                (lsp-enable-which-key-integration)
                (evil-local-set-key 'normal (kbd ",") lsp-command-map)
                (evil-local-set-key 'visual (kbd ",") lsp-command-map)))

  (after 'lsp-ui
    ;; Extra commands.
    (define-key lsp-command-map (kbd ",") 'lsp-describe-thing-at-point)
    (define-key lsp-command-map (kbd ">") 'helm-lsp-global-workspace-symbol)
    (define-key lsp-command-map (kbd "i") 'lsp-ui-imenu)
    ;; Vim-like bindings for peek mode.
    (define-key lsp-ui-peek-mode-map (kbd "j") 'lsp-ui-peek--select-next)
    (define-key lsp-ui-peek-mode-map (kbd "k") 'lsp-ui-peek--select-prev)))

(provide 'init-lsp)
