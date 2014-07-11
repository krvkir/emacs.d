 ; Org directory
(setq org-directory "~/Org/")
(setq org-agenda-files (quote ("~/Org/todo.org")))

;; Python in code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . T)
   (python . T)
   (org . T)))

;; Latex export in ORG
(add-to-list 'org-latex-default-packages-alist '("utf8" "inputenc" t))
(add-to-list 'org-latex-default-packages-alist '("english,russian" "babel" t))
;; (setq org-format-latex-header "\\documentclass{article}
;; \\usepackage[utf8]{inputenc}
;; \\usepackage[usenames]{color}
;; \\usepackage{amsmath}
;; \\usepackage[mathscr]{eucal}
;; \\pagestyle{empty}             % do not remove
;; [PACKAGES]
;; [DEFAULT-PACKAGES]
;; % The settings below are copied from fullpage.sty
;; \\setlength{\\textwidth}{\\paperwidth}
;; \\addtolength{\\textwidth}{-3cm}
;; \\setlength{\\oddsidemargin}{1.5cm}
;; \\addtolength{\\oddsidemargin}{-2.54cm}
;; \\setlength{\\evensidemargin}{\\oddsidemargin}
;; \\setlength{\\textheight}{\\paperheight}
;; \\addtolength{\\textheight}{-\\headheight}
;; \\addtolength{\\textheight}{-\\headsep}
;; \\addtolength{\\textheight}{-\\footskip}
;; \\addtolength{\\textheight}{-3cm}
;; \\setlength{\\topmargin}{1.5cm}
;; \\addtolength{\\topmargin}{-2.54cm}")

;; Org-mode keybindings
(defun my-org-mode-hook ()
  ;;;;;;;;;;;;;;;;;;;;
  ;; Actions
  ;; refile and set-tags
  (define-key org-mode-map (kbd "<f5> r") 'org-refile)
  (define-key org-mode-map (kbd "<f5> t") 'org-set-tags)
  ;; priority
  (define-key org-mode-map (kbd "<f5> p") 'org-priority)
  ;; archive
  (define-key org-mode-map (kbd "<f5> a") 'org-archive-subtree)
  ;; mobile
  (define-key org-mode-map (kbd "<f5> m g") 'org-mobile-pull)
  (define-key org-mode-map (kbd "<f5> m p") 'org-mobile-push)

  ;;;;;;;;;;;;;;;;;;;;
  ;; Keys
  ;; return word-jumping keys
  (define-key org-mode-map (kbd "M-u") 'backward-word)
  (define-key org-mode-map (kbd "M-o") 'forward-word) ; was (prefix)
  ;; shifting nodes
  (define-key org-mode-map (kbd "C-M-L") 'org-shiftmetaright)
  (define-key org-mode-map (kbd "C-M-J") 'org-shiftmetaleft)

  ;; disable lines numbering (to increase performance)
  (linum-mode 0))
(add-hook 'org-mode-hook 'my-org-mode-hook)

;; Agenda
(setq org-agenda-span 14)

;; Org-mobile
(setq org-mobile-directory "~/Yandex.Disk/MobileOrg/")
;; (setq 'org-mobile-files "")
(setq org-mobile-inbox-for-pull "~/Org/mobileorg.org")


;;;;;;;;;;;;;;;;;;;;
;; Convinience issues

;; prevent org-agenda to break window splits
(setq org-agenda-window-setup 'other-window)
