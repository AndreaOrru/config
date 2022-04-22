;; -*- lexical-binding: t -*-

(add-hook 'c-mode-common-hook 'lsp-deferred)
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (add-hook 'before-save-hook 'lsp-format-buffer t t)))

(after 'evil-leader
  (evil-leader/set-key-for-mode 'c-mode "o" 'lsp-clangd-find-other-file)
  (evil-leader/set-key-for-mode 'c++-mode "o" 'lsp-clangd-find-other-file))

(provide 'init-cc)
