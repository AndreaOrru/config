;; -*- lexical-binding: t -*-

;; Use which-key to display available key bindings.
(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(after 'which-key
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.01))

;; Utility function to define which-key prefix descriptions.
(require 'evil-leader)
(defun which-key/describe-prefix (prefix description)
  "Assign a which-key DESCRIPTION to a evil-leader PREFIX."
  (which-key-add-key-based-replacements
    (concat evil-leader/leader " " prefix) description))

;; Use helm-dash for searching documentation.
(require-package 'helm-dash)
(setq dash-docs-enable-debugging nil)
(setq dash-docs-docsets-path (no-littering-expand-var-file-name "docsets"))

;; Key bindings.
(after [evil-leader init-help]
  (which-key/describe-prefix "d" "docs")
  (evil-leader/set-key "ds" 'helm-dash)
  (evil-leader/set-key "dS" 'helm-dash-at-point)

  (which-key/describe-prefix "h" "help")
  (evil-leader/set-key "ha" 'helm-apropos)
  (evil-leader/set-key "hb" 'describe-bindings)
  (evil-leader/set-key "hf" 'describe-function)
  (evil-leader/set-key "hk" 'describe-key)
  (evil-leader/set-key "hv" 'describe-variable))

(provide 'init-help)
