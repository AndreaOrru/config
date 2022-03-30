;; -*- lexical-binding: t -*-

(defun switch-to-alternate-buffer ()
  "Switch between the two most recently used buffers."
  (interactive)
  (switch-to-buffer (other-buffer)))

;; Key bindings.
(after [evil-leader init-help]
  (evil-leader/set-key "TAB" 'switch-to-alternate-buffer)
  (evil-define-key 'normal global-map "s" 'helm-mini)

  (which-key/describe-prefix "b" "buffers")
  (evil-leader/set-key "bb" 'helm-mini)
  (evil-leader/set-key "bd" 'kill-this-buffer))

(provide 'init-buffers)
