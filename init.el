(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

; no one needs this stuff
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(powerline-center-theme)

(global-auto-revert-mode t)

; Incosolata falling back to DejaVu Sans Mono
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 12
                               :weight 'normal)))

; general keybindings
; ag and rgrep search binding
(global-set-key (kbd "C-.") 'ag-project-regexp)
(setq ag-reuse-buffers 't)
(global-set-key (kbd "C-:") 'rgrep)

(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-;") 'find-file-at-point)

(global-set-key [C-left] 'windmove-left)          ; move to left window
(global-set-key [C-right] 'windmove-right)        ; move to right window
(global-set-key [C-up] 'windmove-up)              ; move to upper window
(global-set-key [C-down] 'windmove-down)          ; move to downer window

(require 'tern)
(require 'tern-auto-complete)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-src-fontify-natively t)

(require 'move-text)
(move-text-default-bindings)


;; ; Let's get some jenkins status in here
(require 'butler)
(add-to-list 'butler-server-list
             '(jenkins "ARTERYS - CI"
                       (server-address . "http://localhost:8080")))

; Make things a bit more readable
(setq-default truncate-lines t)
(global-hl-line-mode t)
(show-paren-mode t)
(global-linum-mode t)

; pretty
(load-theme 'sanityinc-tomorrow-eighties t)
;(load-theme 'cyberpunk t)

;; doesn't seem to run in emacs 24.4
;(require 'rainbow-delimiters)
; (global-rainbow-delimiters-mode)

; editing
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-x o") 'next-multiframe-window)

; autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20140208.653/dict")
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)

; autopair
(require 'autopair)
(autopair-global-mode)

; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)

; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; setup indenting size and replace tabs with spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq c-mode-hook
  (function (lambda ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq c-indent-level 4))))
(setq c++-mode-hook
  (function (lambda ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq c-indent-level 4))))

;; ;; clean the whitespace on save.
;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; web mode for our ejs files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

;; rust development
(require 'rust-mode)
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

;; we need some git
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

; js2 vs boring old js
(require 'js2-mode)
(require 'ac-js2)
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; ; flymake/flycheck-tip jshint my js files
;; (require 'flymake-jshint)
;; (add-hook 'js-mode-hook 'flymake-jshint-load)

(require 'ido)
(ido-mode t)
(require 'find-file-in-repository)
(global-set-key (kbd "C-x f") 'find-file-in-repository)


(require 'twittering-mode)
(setq twittering-use-master-password t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "f5bd8485ec9ba65551bf9b9fcaa6af6bcbaebaa4591c0f30d3e512b1d77b3481" default))))
(put 'upcase-region 'disabled nil)
