;; -*- lexical-binding: t -*-

(add-hook 'c-mode-common-hook 'lsp-deferred)
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (add-hook 'before-save-hook 'lsp-format-buffer t t)))

(provide 'init-cc)
