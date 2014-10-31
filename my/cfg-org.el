;; Org directory and files
(setq org-directory "~/Org/")
(setq org-gtd-file (concat org-directory "gtd.org"))
(setq org-journal-file (concat org-directory "journal.org.gpg"))
(setq org-ref-file (concat org-directory "ref.org"))

(setq org-agenda-files org-gtd-file)

;; Some frequently used files -- adding them to registers
(set-register ?g (cons 'file org-gtd-file))
(set-register ?j (cons 'file org-journal-file))
(set-register ?r (cons 'file org-ref-file))

;; Org-mode keybindings
(defun my-org-mode-hook ()
  ;;;;;;;;;;;;;;;;;;;;
  ;; Actions
  ;; refile and todo
  (define-key org-mode-map (kbd "<f5> r") 'org-refile)
  (define-key org-mode-map (kbd "<f5> t") 'org-todo)
  ;; timer
  (define-key org-mode-map (kbd "<f5> e") 'org-set-effort)
  (define-key org-mode-map (kbd "<menu> e") 'org-set-effort)
  (define-key org-mode-map (kbd "<f5> i") 'org-pomodoro) ;; clock in
  ;; priority
  (define-key org-mode-map (kbd "<f5> p") 'org-priority)
  ;; archive
  (define-key org-mode-map (kbd "<f5> a") 'org-archive-subtree)
  ;; mobile
  (define-key org-mode-map (kbd "<f5> m g") 'org-mobile-pull)
  (define-key org-mode-map (kbd "<f5> m p") 'org-mobile-push)
  ;; agenda
  (define-key org-mode-map (kbd "<f5> c") 'org-columns)


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
(setq org-mobile-inbox-for-pull (concat org-directory "mobileorg.org"))

;; Capture
(setq org-default-notes-file org-gtd-file)
(global-set-key (kbd "<f5> <f5>") 'org-capture)
(setq org-capture-templates
      '(("i" "Inbox" entry (file+olp org-gtd-file "Inbox")
         "* %?\n%U\n%i\n%^C")
        ("j" "Journal note" entry (file+datetree org-journal-file)
         "* %?\n%U\n%^C")
        ("r" "Reference" entry (file+datetree org-ref-file)
         "* %?\n%U\n%^C")
        ))


;;;;;;;;;;;;;;;;;;;;
;; Convinience issues

;; prevent org-agenda to break window splits
(setq org-agenda-window-setup 'other-window)

;;;;;;;;;;;;;;;;;;;;
;; Pomodoro
;; (add-hook 'org-pomodoro-finished-hook 'org-clock-in)
;; (add-hook 'org-pomodoro-break-finished-hook 'org-clock-out)

;;;;;;;;;;;;;;;;;;;;
;; Python in code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . T)
   (python . T)
   (org . T)))

;;;;;;;;;;;;;;;;;;;;
;; Latex export in Org
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

