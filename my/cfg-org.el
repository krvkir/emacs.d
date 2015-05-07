;;;;;;;;;;;;;;;;;;;;
;; Org directory and files
(setq org-directory "/home/krvkir/Org/")
(setq org-gtd-file (concat org-directory "gtd.org"))
(setq org-journal-file (concat org-directory "journal.org.gpg"))
(setq org-ref-file (concat org-directory "ref.org"))
(setq org-worknote-file (concat org-directory "work.org"))
(setq org-iread-file (concat org-directory "iread.org"))

;;;;;;;;;;;;;;;;;;;;
;; Some frequently used files -- adding them to registers
(set-register ?g (cons 'file org-gtd-file))
(set-register ?j (cons 'file org-journal-file))
(set-register ?r (cons 'file org-ref-file))
(set-register ?R (cons 'file org-iread-file))

(set-register ?d (cons 'file "~/Docear/projects/"))

;;;;;;;;;;;;;;;;;;;;
;; Capture
(setq org-default-notes-file org-gtd-file)
(global-set-key (kbd "<f5> <f5>") 'org-capture)

(setq org-capture-templates
      '(("i" "Inbox" entry (file+olp org-gtd-file "Inbox")
         "* %?\n%U\n%i\n%^C"
         :kill-buffer t
         )
        ("j" "Journal note" entry (file+datetree org-journal-file)
         "* %?\n%U\n"
         ;; :clock-in t
         ;; :clock-resume t
         :kill-buffer t
         )
        ("r" "Reference" entry (file+datetree org-ref-file)
         "* %?\n%U\n%^C"
         :kill-buffer t
         )
        ("w" "Work note" entry (file+datetree org-worknote-file)
         "* %?\n%U\n%^C"
         :kill-buffer t
         )
        ("c" "Clock" entry (clock)
         "* \n%i (%U, [[%:link][%:description]])"
         :kill-buffer t
         :immediate-finish t
         )
        ("R" "Incremental Reading"
         ;; plain (clock)
         item (file+datetree org-iread-file)
         ;; "\n%i \n\t([[%:link][%:description]], %U)\n"
         "\n%i \n\t([[%:link][%:description]])\n"
         :kill-buffer t
         :immediate-finish t
         )
        ("a" "Incremental Reading append"
         ;; plain (clock)
         item (file+datetree org-iread-file)
         "\n%i \n\n"
         :kill-buffer t
         :immediate-finish t
         )
        ))

;; protocol
(server-start)
(require 'org-protocol)

;;;;;;;;;;;;;;;;;;;;
;; Custom functions

;; Screenshot maker
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

;; Mathematical formulas
(defun my-org-start-math ()
  "Start inputing mathematical formula"
  (interactive)
  (if (not (equal current-input-method nil))
      (set-input-method nil))
  (insert "$$")
  (backward-char 1)
  )


;;;;;;;;;;;;;;;;;;;;
;; Org-mode keybindings
(defun my-org-mode-hook ()
  ;;;;;;;;;;;;;;;;;;;;
  ;; Doing stuff
  
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
  ;; links
  (define-key org-mode-map (kbd "<f5> l s") 'org-store-link)
  (define-key org-mode-map (kbd "<f5> l i") 'org-insert-link)

  ;;;;;;;;;;;;;;;;;;;;
  ;; Toggling stuff
  
  ;; toggle inline images
  (define-key org-mode-map (kbd "<f7> i") 'org-toggle-inline-images)
  ;; latex preview
  (define-key org-mode-map (kbd "<f7> l") 'org-preview-latex-fragment)
  ;; agenda columns
  (define-key org-mode-map (kbd "<f7> c") 'org-columns)
  
  (define-key org-mode-map (kbd "<f7> q") 'my-org-start-math)
  
  ;;;;;;;;;;;;;;;;;;;;
  ;; Keys
  ;; return word-jumping keys
  ;; (define-key org-mode-map (kbd "M-u") 'backward-word) ;
  ;; (define-key org-mode-map (kbd "M-o") 'forward-word) ; was (prefix)
  ;; shifting nodes
  (define-key org-mode-map (kbd "C-M-L") 'org-shiftmetaright)
  (define-key org-mode-map (kbd "C-M-J") 'org-shiftmetaleft)

  ;; disable lines numbering (to increase performance)
  (linum-mode 0))
(add-hook 'org-mode-hook 'my-org-mode-hook)

;; Agenda
(setq org-agenda-span 14)

;;;;;;;;;;;;;;;;;;;;
;; Org-mobile
(setq org-mobile-directory "~/Yandex.Disk/MobileOrg/")
;; (setq 'org-mobile-files "")
(setq org-mobile-inbox-for-pull (concat org-directory "mobileorg.org"))

;;;;;;;;;;;;;;;;;;;;
;; Convinience issues

;; prevent org-agenda to break window splits
(setq org-agenda-window-setup 'other-window)
;; follow links on 'return'
(setq org-return-follows-link t)

;;;;;;;;;;;;;;;;;;;;
;; Pomodoro
;; (add-hook 'org-pomodoro-finished-hook 'org-clock-in)
;; (add-hook 'org-pomodoro-break-finished-hook 'org-clock-out)

;;;;;;;;;;;;;;;;;;;;
;; Code blocks (babel)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . T)
   (python . T)
   (org . T)
   (dot . T)
   (plantuml . T)
   ))
(setq org-plantuml-jar-path "/opt/plantuml/plantuml.jar")

(defun my-org-confirm-babel-evaluate (lang body)
  (not (or
        (string= lang "dot")
        (string= lang "plantuml")
        )
       )  ; don't ask for ditaa
  )
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;;;;;;;;;;;;;;;;;;;;
;; Latex export in Org
;; (add-to-list 'org-latex-default-packages-alist '("utf8" "inputenc" t))
;; (add-to-list 'org-latex-default-packages-alist '("english,russian" "babel" t))
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

;; (require 'org-latex)
;; (setq org-export-latex-listings t)

;; (setq org-latex-classes '())

;; (add-to-list 'org-latex-classes
;;              '("likeword"
;;                "\\documentclass[a4paper,14pt]{extreport}
;; \\usepackage{amsmath,amssymb}
;; [NO-PACKAGES]
;; [NO-DEFAULT-PACKAGES]"
;; ("\\chapter{%s}" . "\\chapter*{%s}")
;; ("\\section{%s}" . "\\section*{%s}")
;; ("\\subsection{%s}" . "\\subsection*{%s}")
;; ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; ("\\paragraph{%s.}" . "\\paragraph*{%s.}")
;; ("\\subparagraph{%s.}" . "\\subparagraph*{%s.}")
;; ))

;; (add-to-list 'org-latex-classes
;;              '("beamer"
;;                "\\documentclass\[presentation\]\{beamer\}"
;;                ("\\section\{%s\}" . "\\section*\{%s\}")
;;                ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;;                ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))
