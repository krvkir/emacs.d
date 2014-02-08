;; maxima
(org-babel-do-load-languages
 'org-babel-load-languages
 '((maxima . t))) ; activate maxima
(setq org-confirm-babel-evaluate 'nil)

;; Maxima modes
(add-to-list 'load-path "/usr/share/maxima/5.30.0/emacs/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.mac\\'" . maxima-mode))

;; Variables
(setq imaxima-fnt-size "small")
(setq imaxima-latex-preamble "")
(setq imaxima-max-scale 0.85)
(setq imaxima-maxima-program "/home/chi/bin/maxima-clisp")
(setq maxima-command "maxima-clisp")
