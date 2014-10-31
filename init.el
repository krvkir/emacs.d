;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom variables (automatically set)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(default-input-method "russian-computer")
 '(delete-selection-mode t)
 '(dired-after-readin-hook (quote ergoemacs-setup-local-prefixes))
 '(dirtrack-directory-change-hook (quote ergoemacs-shell-here-directory-change-hook))
 '(ecb-auto-activate nil)
 '(ecb-auto-compatibility-check nil)
 '(ecb-compilation-predicates nil)
 '(ecb-compile-window-height 6)
 '(ecb-compile-window-temporally-enlarge (quote both))
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-history-make-buckets (quote mode))
 '(ecb-key-map
   (quote
    ("<f4>"
     (t "fh" ecb-history-filter)
     (t "fs" ecb-sources-filter)
     (t "fm" ecb-methods-filter)
     (t "fr" ecb-methods-filter-regexp)
     (t "ft" ecb-methods-filter-tagclass)
     (t "fc" ecb-methods-filter-current-type)
     (t "fp" ecb-methods-filter-protection)
     (t "fn" ecb-methods-filter-nofilter)
     (t "fl" ecb-methods-filter-delete-last)
     (t "ff" ecb-methods-filter-function)
     (t "p" ecb-nav-goto-previous)
     (t "n" ecb-nav-goto-next)
     (t "lc" ecb-change-layout)
     (t "lr" ecb-redraw-layout)
     (t "lw" ecb-toggle-ecb-windows)
     (t "lt" ecb-toggle-layout)
     (t "s" ecb-window-sync)
     (t "r" ecb-rebuild-methods-buffer)
     (t "a" ecb-toggle-auto-expand-tag-tree)
     (t "x" ecb-expand-methods-nodes)
     (t "h" ecb-show-help)
     (t "gl" ecb-goto-window-edit-last)
     (t "g1" ecb-goto-window-edit1)
     (t "g2" ecb-goto-window-edit2)
     (t "gc" ecb-goto-window-compilation)
     (t "gd" ecb-goto-window-directories)
     (t "gs" ecb-goto-window-sources)
     (t "gm" ecb-goto-window-methods)
     (t "gh" ecb-goto-window-history)
     (t "ga" ecb-goto-window-analyse)
     (t "gb" ecb-goto-window-speedbar)
     (t "md" ecb-maximize-window-directories)
     (t "ms" ecb-maximize-window-sources)
     (t "mm" ecb-maximize-window-methods)
     (t "mh" ecb-maximize-window-history)
     (t "ma" ecb-maximize-window-analyse)
     (t "mb" ecb-maximize-window-speedbar)
     (t "e" eshell)
     (t "o" ecb-toggle-scroll-other-window-scrolls-compile)
     (t "\\" ecb-toggle-compile-window)
     (t "/" ecb-toggle-compile-window-height)
     (t "," ecb-cycle-maximized-ecb-buffers)
     (t "." ecb-cycle-through-compilation-buffers))))
 '(ecb-layout-name "leftright1")
 '(ecb-layout-window-sizes
   (quote
    (("leftright1"
      (ecb-directories-buffer-name 0.1455223880597015 . 0.6404494382022472)
      (ecb-sources-buffer-name 0.1455223880597015 . 0.16853932584269662)
      (ecb-history-buffer-name 0.1455223880597015 . 0.19101123595505617)
      (ecb-methods-buffer-name 0.11940298507462686 . 1.0)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/" "/"))))
 '(ecb-tree-navigation-by-arrow nil)
 '(ecb-windows-width 0.3)
 '(eshell-post-command-hook (quote ergoemacs-shell-here-directory-change-hook))
 '(ido-vertical-define-keys (lambda nil (quote C-n-C-p-up-down-left-right)))
 '(initial-scratch-message
   (lambda nil
     (substitute-command-keys ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with \\[find-file],
;; then enter the text in that file's own buffer.")))
 '(org-CUA-compatible nil)
 '(org-catch-invisible-edits (quote smart))
 '(org-columns-default-format
   "%50ITEM(Task) %PRIORITY %TODO %TAGS %Effort(EstTime){:} %CLOCKSUM(SpentTime)")
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-global-properties
   (quote
    (("Effort_ALL" . "0:30 1:00 1:30 2:00 2:30 3:00 3:30 4:00 4:30 5:00 5:30 6:00 6:30 7:00 7:30 8:00"))))
 '(org-pomodoro-long-break-length 15)
 '(org-replace-disputed-keys nil)
 '(org-special-ctrl-a/e (lambda nil t))
 '(org-src-fontify-natively t)
 '(org-support-shift-select (lambda nil t))
 '(recentf-menu-before (lambda nil "Close"))
 '(recentf-mode t)
 '(scroll-error-top-bottom (lambda nil t))
 '(set-mark-command-repeat-pop (lambda nil t))
 '(shell-mode-hook (quote ergoemacs-shell-here-hook))
 '(shift-select-mode (lambda nil t))
 '(smex-prompt-string
   (lambda nil
     (substitute-command-keys "\\[execute-extended-command] ")))
 '(tramp-verbose 10)
 '(word-wrap t))

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  )
(add-to-list 'load-path "/usr/lib/node_modules/tern/emacs/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings

;; registers
;; (set-register ?i (cons 'file "~/.emacs.d/init.el"))
;; (set-register ?m (cons 'file "~/.emacs.d/my/"))
;; (set-register ?i (cons 'file "~/.emacs.d/init.el"))

;; some keybindings
(global-unset-key (kbd "<f4>"))

;; disable backup files
(setq make-backup-files nil)

;; bookmarks
(global-set-key (kbd "<f4> b") 'bookmark-jump)

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
(ido-vertical-mode 1)
(setq ido-default-buffer-method (quote selected-window))
(setq ido-enable-flex-matching t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some packages needed to be loaded before ErgoEmacs
;; (because of modes-specific keybindings which ErgoEmacs resets)

;;;;;;;;;;;;;;;;;;;;
;; Org-mode
(load-file "~/.emacs.d/my/cfg-org.el")

;;;;;;;;;;;;;;;;;;;;
;; Mail client
(load-file "~/.emacs.d/my/cfg-mu4e.el")
(global-set-key (kbd "<f4> m") 'mu4e)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interface

;;;;;;;;;;;;;;;;;;;;
;; Ergoemacs
(require 'ergoemacs-mode)
(load-file "~/.emacs.d/my/cfg-ergoemacs.el")
;; (setq ergoemacs-theme "standard")
(ergoemacs-mode 1)

;;;;;;;;;;;;;;;;;;;;
;; Tuning

;; kill-whole-line
(global-set-key (kbd "M-9") 'kill-whole-line)
;; just-one-space
(global-set-key (kbd "C-SPC") 'just-one-space)

;; forward/backward-sexp
(global-set-key (kbd "M-{") 'backward-sexp)
(global-set-key (kbd "M-}") 'forward-sexp)

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

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(transparency 0.90)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Development

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M->") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<")   'mc/mark-previous-like-this)

;;;;;;;;;;;;;;;;;;;;
;; ECB and CEDET
(require 'ecb)
(setq stack-trace-on-error t)
(setq ecb-tip-of-the-day nil)

(global-semantic-idle-scheduler-mode t)
(global-semantic-idle-completions-mode t)
(global-semantic-idle-summary-mode t)

(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)

;; (global-unset-key (kbd "<f4>"))
(defun krvkir-ecb-activate-hook ()
  ;; Turning on
  (semantic-mode t)
  )
(add-hook 'ecb-activate-hook 'krvkir-ecb-activate-hook)


;;;;;;;;;;;;;;;;;;;;
;; Auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; Eclim
(require 'eclim)
(global-eclim-mode)
;; autocompletion via eclim
(require 'ac-emacs-eclim-source)
(defun krvkir-eclim-mode-hook ()
  (define-key eclim-mode-map (kbd "C-c C-c") 'eclim-project-build)
  )
(add-hook 'eclim-mode-hook 'krvkir-eclim-mode-hook)

(ac-emacs-eclim-config)

;;;;;;;;;;;;;;;;;;;;
;; Version control
(setq vc-annotate-background nil)
(setq vc-annotate-very-old-color nil)
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

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Projectile
;; (require 'projectile)
;; (projectile-global-mode)
;; (setq projectile-tags-command "ctags -R -e %s")
;; ;; bindings
;; ;; ;; tags
;; ;; (global-set-key (kbd "<f3>") 'visit-tags-table)

;;;;;;;;;;;;;;;;;;;;
;; Hideshow
(require 'hideshow)
(global-unset-key (kbd "<f3>"))
(global-set-key (kbd "C-M-f") 'hs-toggle-hiding)
(global-set-key (kbd "<f3> t") 'hs-toggle-hiding)
(global-set-key (kbd "<f3> h") 'hs-hide-all)
(global-set-key (kbd "<f3> s") 'hs-show-all)
(global-set-key (kbd "<f3> l") 'hs-hide-level)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
;; (setq-default c-default-style "bsd"
;;       c-basic-offset 4)



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
;; (setq elpy-rpc-backend "jedi")
;; custom tweaks
(defun my-python-mode-hook ()
  ;; (set-input-method "TeX")
  (hs-minor-mode)
  ;; (projectile-on)
  ;; (jedi:ac-setup)
  )
(add-hook 'python-mode-hook 'my-python-mode-hook)
(setenv "PYTHONPATH" "/home/krvkir/workspace/Frwk/mod/")

;;;;;;;;;;;;;;;;;;;;
;; Haskell
(defun my-haskell-mode-hook ()
  (turn-on-haskell-indentation))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

;;;;;;;;;;;;;;;;;;;;
;; Octave/Matlab
(delete 'auto-mode-alist '("\\.m\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;;;;;;;;;;;;;;;;;;;;
;; PHP
(require 'php-mode)
(require 'flymake-php)
(defun krvkir-php-mode-hook ()
  ;; code style
  ;; (c-set-style "linux")
  ;; (setq c-basic-offset 4)
  ;; code editing 
  (hs-minor-mode)
  (local-set-key (kbd "RET") 'c-context-line-break)
  (flymake-php-load)
  ;; (ac-php-mode-setup)
  ;; other
  ;; (projectile-on)
  )
(add-hook 'php-mode-hook 'krvkir-php-mode-hook)
;; ;; interpreter in emacs shell
;; (require 'php-inf)
;; helpers
(load-file "~/.emacs.d/my/php-helpers.el")
(load-file "~/.emacs.d/my/phpdocumentor.el")

;;;;;;;;;;;;;;;;;;;;
;; Web-mode
(defun krvkir-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  )
(add-hook 'web-mode-hook 'krvkir-web-mode-hook)

;;;;;;;;;;;;;;;;;;;;
;; JavaScript
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

;; tern
(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; (defun my-js-mode-hook ()
;;   (local-set-key (kbd "RET") 'c-context-line-break))
;; (add-hook 'js-mode-hook 'my-js-mode-hook)


;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Maxima
;; (load-file "~/.emacs.d/my/cfg-maxima.el")

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; AMPL-mode (A Mathematical Programming Language)
;; (load-file "~/.emacs.d/my/ampl-mode.el")


;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Dired
;; (defun my-dired-mode-hook ()
;;   ;; Open files in external app
;;   (local-set-key (kbd "<f3>") 'ergoemacs-open-in-external-app))
;; (add-hook 'dired-mode-hook 'my-dired-mode-hook)
