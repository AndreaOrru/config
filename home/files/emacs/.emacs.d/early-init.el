;; -*- lexical-binding: t -*-

;; Prevent garbage collection during startup.
;; We rely on GCMH to set it dynamically later on.
(setq gc-cons-threshold most-positive-fixnum)

;; Prevent automatic (package-initialize) at startup.
(setq package-enable-at-startup nil)

;; Prefer newer byte-compiled files.
(setq load-prefer-newer t)

(provide 'early-init)
