;; -*- lexical-binding: t -*-

;; Enable LSP and automatic formatting for C/C++.
(add-hook 'c-mode-common-hook 'lsp-deferred)
(add-hook 'c-mode-common-hook
          #'(lambda()
              (add-hook 'before-save-hook 'lsp-format-buffer t t)))

;; Enable C++ dash docset.
(after 'init-help
  (add-hook 'c++-mode-hook
            #'(lambda() (dash-docs-activate-docset "C++"))))

;; Key bindings.
(after 'evil-leader
  ;; Switch between implementation and header file.
  (evil-leader/set-key-for-mode 'c-mode "o" 'lsp-clangd-find-other-file)
  (evil-leader/set-key-for-mode 'c++-mode "o" 'lsp-clangd-find-other-file))

(provide 'init-cc)
