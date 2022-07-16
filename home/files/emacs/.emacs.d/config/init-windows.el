;; -*- lexical-binding: t -*-

;; Temporary windows don't stick around.
(require-package 'popwin)
(add-hook 'after-init-hook 'popwin-mode)
(after 'popwin
  (add-to-list 'popwin:special-display-config 'apropos-mode))

;; Enforce rules for popup windows.
(require-package 'shackle)
(add-hook 'after-init-hook 'shackle-mode)
;; Open Helm buffers at the bottom of the frame.
(after 'shackle
  (setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4))))

;; Split and switch to the new window immediately.
(global-set-key (kbd "C-x 2")
                #'(lambda() (interactive) (evil-window-split) (other-window 1)))
(global-set-key (kbd "C-x 3")
                #'(lambda() (interactive) (evil-window-vsplit) (other-window 1)))

(provide 'init-windows)
