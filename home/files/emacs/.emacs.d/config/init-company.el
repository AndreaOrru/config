;; -*- lexical-binding: t -*-

;; Use company-mode for complation everywhere.
(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(after 'company
  ;; Show completions faster.
  (setq company-idle-delay 0.15))

;; Use TAB to start completing (or indent if necessary, as per default).
(global-set-key (kbd "TAB") 'company-indent-or-complete-common)

(provide 'init-company)
