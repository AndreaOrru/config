;; -*- lexical-binding: t -*-

(require-package 'flycheck)

;; Display Flycheck error list as a sticky popup.
(after 'popwin
  (push '(flycheck-error-list-mode :stick t)
        popwin:special-display-config))

(after [evil-leader flycheck init-help]
  ;; Use "SPC e" as prefix for Flycheck commands.
  (which-key/describe-prefix "e" "errors")
  (evil-leader/set-key "e" flycheck-command-map)

  ;; Use margin instead of fringe in terminal.
  (add-hook 'flycheck-mode-hook
            #'(lambda() (flycheck-set-indication-mode 'left-margin))))

(provide 'init-flycheck)
