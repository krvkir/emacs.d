;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom variables (automatically set)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(default-input-method "russian-computer")
 '(ecb-auto-activate nil)
 '(ecb-auto-compatibility-check nil)
 '(ecb-history-make-buckets (quote mode))
 '(ecb-layout-name "leftright2")
 '(ecb-layout-window-sizes (quote (("leftright2" (ecb-directories-buffer-name 0.08 . 0.635) (ecb-sources-buffer-name 0.08 . 0.35) (ecb-methods-buffer-name 0.14 . 0.635) (ecb-history-buffer-name 0.14 . 0.35)) ("leftright1" (ecb-directories-buffer-name 0.18 . 0.63) (ecb-sources-buffer-name 0.1787709497206704 . 0.17) (ecb-history-buffer-name 0.18 . 0.185) (ecb-methods-buffer-name 0.162 . 0.99)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/" "/"))))
 '(org-catch-invisible-edits (quote smart))
 '(org-src-fontify-natively t)
 '(word-wrap t))

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings

;; disable backup files
(setq make-backup-files nil)

;; bookmarks
(global-set-key (kbd "C-b") 'bookmark-set)
(global-set-key (kbd "M-b") 'bookmark-jump)
(global-set-key (kbd "<f4>") 'bookmark-bmenu-list)

;; file paths in status line
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; current line highlighting
(global-hl-line-mode 1)

;; abbrevations
(setq save-abbrevs "silently")

;; lines
(global-linum-mode) ; line numbers
(setq-default truncate-lines t)
(global-visual-line-mode)

;; buffers
(require 'ido)
(defalias 'list-buffers 'ibuffer)
(ido-mode 1)
(setq ido-default-buffer-method (quote selected-window))
(setq ido-enable-flex-matching t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interface

;; disable beeps
(setq ring-bell-function 'ignore)

;; fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 80 :width condensed :family "Liberation Mono" :embolden t))))
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))


;; parentheses
(show-paren-mode 1) ; highlight paired parentheses
(setq show-paren-style 'expression)

;; menu, toolbar, scrollbar
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 1)

;; startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; theme
(load-theme 'sanityinc-solarized-light)

;; info path
(add-to-list 'Info-directory-list "/usr/share/info")

;; keymapping
(global-set-key (kbd "№") (lambda () (interactive) (insert "#")))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Development

;;;;;;;;;;;;;;;;;;;;
;; ECB and CEDET
(require 'ecb)
(setq stack-trace-on-error t)
(setq ecb-tip-of-the-day nil)

(global-semantic-idle-scheduler-mode t)
;; (global-semantic-idle-completions-mode t)
;; (global-semantic-idle-summary-mode t)

(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)

(semantic-mode 1)

;;;;;;;;;;;;;;;;;;;;
;; Auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; ;; Eclim
;; (require 'eclim)
;; (global-eclim-mode)
;; ;; autocompletion via eclim
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)

;;;;;;;;;;;;;;;;;;;;
;; Version control
(setq vc-annotate-background nil)
(setq vc-annotate-very-old-color nil)
(add-hook 'ecb-activate-hook (lambda () (semantic-mode t)))
;; ;; svn
;; (require 'vc-svn)
;; (autoload 'svn-status "dsvn" "Run `svn status'." t)
;; (autoload 'svn-update "dsvn" "Run `svn update'." t)

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Yasnippet
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (yas/load-directory "~/.emacs.d/my/snippets")
;; (global-set-key (kbd "M-RET") 'yas/exit-all-snippets)

;;;;;;;;;;;;;;;;;;;;
;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-tags-command "ctags -R -e %s")
;; bindings
;; ;; tags
;; (global-set-key (kbd "<f3>") 'visit-tags-table)

;;;;;;;;;;;;;;;;;;;;
;; Hideshow
(require 'hideshow)
(global-set-key (kbd "C-M-f") 'hs-toggle-hiding)
(global-set-key (kbd "<f3>") 'hs-toggle-hiding)
(global-set-key (kbd "C-<f3>") 'hs-hide-all)
(global-set-key (kbd "C-S-<f3>") 'hs-show-all)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default c-default-style "bsd"
      c-basic-offset 4)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Major modes

;;;;;;;;;;;;;;;;;;;;
;; Elisp
(defun my-elisp-mode-hook ()
  (hs-minor-mode))
(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)

;;;;;;;;;;;;;;;;;;;;
;; Python
;; elpy
(elpy-enable)
(setq elpy-rpc-backend "jedi")
;; custom tweaks
(defun my-python-mode-hook ()
  ;; (set-input-method "TeX")
  (hs-minor-mode)
  (projectile-on)
  (jedi:ac-setup))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;;;;;;;;;;;;;;;;;;;;
;; Haskell
(defun my-haskell-mode-hook ()
  (turn-on-haskell-indentation))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; PHP
;; (require 'php-mode)
;; (require 'flymake-php)
;; (defun my-php-mode-hook ()
;;   (c-set-style "bsd")
;;   (setq c-basic-offset 4)
;;   (hs-minor-mode)
;;   (local-set-key (kbd "RET") 'c-context-line-break)
;;   (flymake-php-load)
;;   (ac-php-mode-setup)
;;   (projectile-on))
;; (add-hook 'php-mode-hook 'my-php-mode-hook)
;; ;; interpreter in emacs shell
;; (require 'php-inf)
;; ;; helpers
;; (load-file "~/.emacs.d/my/php-helpers.el")
;; (load-file "~/.emacs.d/my/phpdocumentor.el")

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; JavaScript
;; (require 'js-mode)
;; (defun my-js-mode-hook ()
;;   (local-set-key (kbd "RET") 'c-context-line-break))
;; (add-hook 'js-mode-hook 'my-js-mode-hook)

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Maxima
;; (load-file "~/.emacs.d/my/cfg-maxima.el")

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; AMPL-mode (A Mathematical Programming Language)
;; (load-file "~/.emacs.d/my/ampl-mode.el")


;;;;;;;;;;;;;;;;;;;;
;; Dired
(defun my-dired-mode-hook ()
  ;; Open files in external app
  (local-set-key (kbd "<f3>") 'ergoemacs-open-in-external-app))
(add-hook 'dired-mode-hook 'my-dired-mode-hook)

;;;;;;;;;;;;;;;;;;;;
;; Ergoemacs
;; ergoemacs
(setq debug-on-error t)
(require 'ergoemacs-mode)
(setq ergoemacs-debug t)
(load-file "~/.emacs.d/my/cfg-ergoemacs.el")
(ergoemacs-mode 1)



;;;;;;;;;;;;;;;;;;;;
;; Org mode
(load-file "~/.emacs.d/my/cfg-org.el")



;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Which file to open
;; (find-file "~/.emacs")
;; (find-file "~/Org/todo.org")
