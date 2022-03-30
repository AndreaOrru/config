;; -*- lexical-binding: t -*-

(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-descbinds)
(require-package 'helm-swoop)

(add-hook 'after-init-hook 'helm-mode)
(add-hook 'after-init-hook 'helm-descbinds-mode)

(after [evil-leader helm]
  (require 'helm)
  (require 'helm-swoop)
  ;; Open Helm buffers as a popup window.
  (setq helm-display-function 'pop-to-buffer)
  ;; Open Helm Swoop buffers inside current window.
  (setq helm-swoop-split-with-multiple-windows t)
  ;; Preserve syntax highlighting in Helm Swoop.
  (setq helm-swoop-speed-or-color t)
  ;; Dynamic buffer column width.
  (setq helm-buffer-max-length nil)

  ;; Helm substitute commands.
  (global-set-key (kbd "C-s") 'helm-swoop-without-pre-input)
  (global-set-key (kbd "M-s") 'helm-multi-swoop-all)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)

  ;; Helm additional commands.
  (evil-leader/set-key "SPC" 'helm-M-x)
  (evil-leader/set-key "/" 'helm-projectile-ag)
  (evil-leader/set-key "r" 'helm-resume)
  (evil-leader/set-key "P" 'helm-show-kill-ring)
  (evil-global-set-key 'normal ",." 'helm-semantic-or-imenu)

  ;; Vim-like navigation.
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (define-key helm-map (kbd "<escape>") 'helm-keyboard-quit)

  ;; C-w deletes previous word in minibuffer.
  (define-key helm-map (kbd "C-w") 'evil-delete-backward-word)
  (define-key helm-swoop-map (kbd "C-w") 'evil-delete-backward-word))

(provide 'init-helm)
