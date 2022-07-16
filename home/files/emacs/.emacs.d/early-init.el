;; -*- lexical-binding: t -*-

(setq gc-cons-threshold (* 256 1024 1024))  ;; GC threshold = 256 MB.
(setq load-prefer-newer t)                  ;; Prefer newer byte-compiled files.
(setq package-enable-at-startup nil)        ;; Prevent (package-initialize) at startup.

(provide 'early-init)
