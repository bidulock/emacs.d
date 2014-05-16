(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

; general keybindings
(global-set-key (kbd "C-.") 'rgrep)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

(global-set-key [C-left] 'windmove-left)          ; move to left window
(global-set-key [C-right] 'windmove-right)        ; move to right window
(global-set-key [C-up] 'windmove-up)              ; move to upper window
(global-set-key [C-down] 'windmove-down)          ; move to downer window

(require 'minimap)
(global-set-key (kbd "C-x m") 'minimap-toggle)

; Make things a bit more readable
(setq-default truncate-lines t)
(global-hl-line-mode t)
(show-paren-mode t)
(global-linum-mode t)

; pretty
(load-theme 'tsdh-dark t)
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

; editing 
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.1/elpa/auto-complete-20140208.653/dict")
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)

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

;; web mode for our ejs files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))

;; we need some git
(require 'magit)

; js2 vs boring old js
(require 'js2-mode)
(require 'ac-js2)
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

; flymake jshint my js files
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-jshint-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(inhibit-startup-screen t)
 '(minimap-update-delay 0.5))

(require 'ido)
(ido-mode t)
(require 'find-file-in-repository)
(global-set-key (kbd "C-x f") 'find-file-in-repository)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
