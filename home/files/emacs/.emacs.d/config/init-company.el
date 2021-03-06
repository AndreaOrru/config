;; -*- lexical-binding: t -*-

;; Use company-mode for complation everywhere.
(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(after 'company
  (setq company-show-numbers t     ; Show numbered completions.
        company-idle-delay 0.15))  ; Show completions faster.

;; Taken from abo-abo/oremacs.
(defun my/company-number ()
  "Forward to `company-complete-number'.

Unless the number is potentially part of the candidate.
In that case, insert the number."
  (interactive)
  (let* ((k (this-command-keys))
         (re (concat "^" company-prefix k)))
    (if (or (cl-find-if (lambda (s) (string-match re s))
                        company-candidates)
            (> (string-to-number k)
               (length company-candidates))
            (looking-back "[0-9]+\\.[0-9]*" (line-beginning-position)))
        (self-insert-command 1)
      (company-complete-number
       (if (equal k "0")
           10
         (string-to-number k))))))

;; Use TAB to start completing (or indent if necessary, as per default).
(global-set-key (kbd "TAB") 'company-indent-or-complete-common)

(after 'company
  ;; Taken from abo-abo/oremacs.
  ;; Map digits to completions directly, when possible.
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x) 'my/company-number))
          (number-sequence 0 9))))

(provide 'init-company)
