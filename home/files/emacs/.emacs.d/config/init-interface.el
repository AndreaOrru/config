;; -*- lexical-binding: t -*-

;; Disable menu bar.
(menu-bar-mode -1)

;; Load theme.
(setq custom-safe-themes t)
(require-package 'doom-themes)
(load-theme 'doom-gruvbox)

;; Enable Doom modeline.
(require-package 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)
(after 'doom-modeline
  (set-face-background 'mode-line-inactive "black")
  (setq doom-modeline-lsp nil)
  (setq doom-modeline-buffer-encoding nil))

;; Enable mouse in terminal.
(xterm-mouse-mode 1)
(mouse-wheel-mode 1)

;; Settings for smoother scrolling.
(setq scroll-preserve-screen-position t
      scroll-conservatively 101
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(           3
                                  ((shift) . 1)))

(setq inhibit-startup-screen t)    ;; Disable Emacs startup screen.
(setq ring-bell-function 'ignore)  ;; Disable audible bell.
(fset 'yes-or-no-p 'y-or-n-p)      ;; Use Y/N instead of yes/no.

(provide 'init-interface)
