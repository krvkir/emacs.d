;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom variables (automatically set)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(ecb-auto-activate nil)
 '(ecb-auto-compatibility-check nil)
 '(ecb-layout-name "leftright2")
 '(ecb-layout-window-sizes (quote (("leftright2" (ecb-directories-buffer-name 0.08 . 0.635) (ecb-sources-buffer-name 0.08 . 0.35) (ecb-methods-buffer-name 0.14 . 0.635) (ecb-history-buffer-name 0.14 . 0.35)) ("leftright1" (ecb-directories-buffer-name 0.18 . 0.63) (ecb-sources-buffer-name 0.1787709497206704 . 0.17) (ecb-history-buffer-name 0.18 . 0.185) (ecb-methods-buffer-name 0.162 . 0.99)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(org-agenda-files (quote ("~/Org/todo.org")))
 '(org-catch-invisible-edits (quote error))
 '(org-src-fontify-natively t)
 '(word-wrap t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interface

;; Fonts
;;(set-default-font "-unknown-Inconsolata LGC-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 90 :width condensed :family "Liberation Mono" :embolden t))))
 '(org-code ((t (:inherit shadow :family "Liberation Mono"))))
 '(org-level-1 ((t (:inherit outline-1 :underline t :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-table ((t (:height 90 :family "Liberation Mono")))))

;; Ergoemacs
(require 'ergoemacs-mode)
(setq ergoemacs-theme "lvl2")
(ergoemacs-mode 1)

;; lvl2.5 handcrafted
(global-set-key (kbd "M-s") 'other-window)
(global-set-key (kbd "M-h") 'beginning-of-visual-line)
(global-set-key (kbd "M-H") 'end-of-visual-line)
(global-set-key (kbd "M-a") 'execute-extended-command)

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-V") 'yank-pop)

(global-set-key (kbd "M-p") 'recenter-top-bottom)
(global-set-key (kbd "C-.") 'keyboard-quit)

(global-set-key (kbd "M-J") 'backward-sexp)
(global-set-key (kbd "M-L") 'forward-sexp)
(global-set-key (kbd "M-I") 'scroll-down-command)
(global-set-key (kbd "M-K") 'scroll-up-command)
(global-set-key (kbd "M-U") 'backward-paragraph)
(global-set-key (kbd "M-O") 'forward-paragraph)

(global-set-key (kbd "C-w") 'kill-buffer)
(global-set-key (kbd "M-w") 'kill-buffer)

;; Parentheses
(show-paren-mode 1) ; highlight paired parentheses
(setq show-paren-style 'expression)

;; Menu, toolbar, scrollbar
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 1)

;; Startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Lines
(global-linum-mode) ; line numbers
(setq-default truncate-lines nil)
(global-visual-line-mode)

;; Buffers
(require 'ido)
(defalias 'list-buffers 'ibuffer)
(ido-mode 1)
(setq ido-default-buffer-method (quote selected-window))
(setq ido-enable-flex-matching t)

;; Theme
(load-theme 'sanityinc-tomorrow-day)

;; Info path
(add-to-list 'Info-directory-list "/usr/share/info")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plugins from DBushenko

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/my/snippets")
(global-set-key (kbd "M-RET") 'yas/exit-all-snippets)

;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-tags-command "ctags -R -e %s")

;; ;; Eclim
;; (require 'eclim)
;; (global-eclim-mode)
;; ;; autocompletion via eclim
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)

;; folding
(global-set-key (kbd "C-M-f") 'hs-toggle-hiding)

;; abbrevations
(setq save-abbrevs "silently")

;; ;; Version control - SVN
;; (require 'vc-svn)
;; (autoload 'svn-status "dsvn" "Run `svn status'." t)
;; (autoload 'svn-update "dsvn" "Run `svn update'." t)

;; File paths in status line
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; current line highlighting
(global-hl-line-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Languages

;; Indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default c-default-style "bsd"
      c-basic-offset 4)

;;;;;;;;;;;;;;;;;;;;
;; python

;;;;;;;;;;;;;;;;;;;;
;; Maxima
;(load "~/.emacs.d/my/cfg-maxima.el") 

;;;;;;;;;;;;;;;;;;;;
;; PHP
(require 'php-mode)
(require 'flymake-php)
(defun my-php-mode-hook ()
  (c-set-style "bsd")
  (setq c-basic-offset 4)
  (hs-minor-mode)
  (local-set-key (kbd "RET") 'c-context-line-break)
  (flymake-php-load)
  (ac-php-mode-setup)
  (projectile-on)
)
(add-hook 'php-mode-hook 'my-php-mode-hook)

;;;;;;;;;;;;;;;;;;;;
;; JavaScript
;; (require 'js-mode)
(defun my-js-mode-hook ()
  (local-set-key (kbd "RET") 'c-context-line-break)
)
(add-hook 'js-mode-hook 'my-js-mode-hook)

;; ;; php interpreter in emacs shell
;; (require 'php-inf)

;; PHP helpers
(load-file "~/.emacs.d/my/php-helpers.el")
(load-file "~/.emacs.d/my/phpdocumentor.el")

;;;;;;;;;;;;;;;;;;;;
;; Org mode
(load-file "~/.emacs.d/my/cfg-org.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB

(require 'ecb)
(setq stack-trace-on-error t)
(setq ecb-tip-of-the-day nil)

;; Version control
(setq vc-annotate-background nil)
(setq vc-annotate-very-old-color nil)

(add-hook 'ecb-activate-hook (lambda () (semantic-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Which file to open
;; (find-file "~/.emacs")
;; (find-file "~/Org/todo.org")

