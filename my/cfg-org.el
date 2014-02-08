;; Org Mode global keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Python in code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Latex export in ORG
(add-to-list 'org-export-latex-packages-alist '("english,russian" "babel" t))
(setq org-format-latex-header "\\documentclass{article}
\\usepackage[usenames]{color}
\\usepackage{amsmath}
\\usepackage[mathscr]{eucal}
\\pagestyle{empty}             % do not remove
[PACKAGES]
[DEFAULT-PACKAGES]
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")

;; Org-mode keybindings
(defun my-org-mode-hook ()
  (local-set-key (kbd "M-h") 'org-beginning-of-line)
  (local-set-key (kbd "M-H") 'org-end-of-line)
  )
(add-hook 'org-mode-hook 'my-org-mode-hook)
