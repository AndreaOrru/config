;; -*- lexical-binding: t -*-

(require-package 'evil-mc)
(add-hook 'after-init-hook 'global-evil-mc-mode)

;; Disable bar cursor (breaks in terminal).
(after 'evil-mc
  (setq evil-mc-enable-bar-cursor nil))

;; Use C-g to undo all cursors.
(defun my/keyboard-quit ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (evil-force-normal-state)
  (keyboard-quit))

;; Key bindings.
(after 'evil-mc
  ;; Add a new cursor and move to the next line.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-j") 'evil-mc-make-cursor-move-next-line)
  ;; Add a new cursor and move to the previous line.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-k") 'evil-mc-make-cursor-move-prev-line)

  ;; Add a new cursor and move to the next match.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-n") 'evil-mc-make-and-goto-next-match)
  ;; Add a new cursor and move to the previous match.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-p") 'evil-mc-make-and-goto-prev-match)

  ;; Skip matches.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "M-n") 'evil-mc-skip-and-goto-next-match)
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "M-p") 'evil-mc-skip-and-goto-prev-match)

  ;; Undo all cursors.
  (evil-define-key '(normal visual insert) evil-mc-key-map
    (kbd "C-g") 'my/keyboard-quit))

(provide 'init-multiple-cursors)
