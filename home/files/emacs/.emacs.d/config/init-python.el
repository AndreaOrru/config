;; -*- lexical-binding: t -*-

;; Enable LSP and automatic formatting for Python.
(add-hook 'python-mode-hook 'lsp-deferred)
(add-hook 'python-mode-hook
          #'(lambda()
              (add-hook 'before-save-hook 'lsp-format-buffer t t)))

;; Enable Python dash docset.
(after 'init-help
  (add-hook 'python-mode-hook
            #'(lambda() (dash-docs-activate-docset "Python 3"))))

(provide 'init-python)
