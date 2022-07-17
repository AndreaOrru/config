;; -*- lexical-binding: t -*-

;; Keep the code always indented.
(require-package 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)

;; Highlight brackets according to their depth.
(require-package 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(defun describe-symbol-at-point ()
  "Display the full documentation of the symbol at point."
  (interactive)
  (describe-symbol (symbol-at-point)))

;; Key bindings.
(after 'evil
  (evil-define-key 'visual emacs-lisp-mode-map (kbd ",e") 'eval-region)
  (evil-define-key '(normal visual) emacs-lisp-mode-map (kbd ",p") 'check-parens)
  (evil-define-key '(normal visual) emacs-lisp-mode-map (kbd ",,")
    'describe-symbol-at-point))

(provide 'init-emacs-lisp)
