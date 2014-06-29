(ergoemacs-theme-component krvkir-org () "Krvkir's org config"
  (when org-mode-hook
    ;; ;; Org Mode global keybindings
    ;; (global-set-key "\C-cl" 'org-store-link)
    ;; (global-set-key "\C-cc" 'org-capture)
    ;; (global-set-key "\C-ca" 'org-agenda)
    ;; (global-set-key "\C-cb" 'org-iswitchb)

    ;; Refile and set-tags
    (define-key org-mode-map (kbd "<f5> r") 'org-refile)
    (define-key org-mode-map (kbd "<f5> t") 'org-set-tags)
    ;; Priority
    (define-key org-mode-map (kbd "<f5> p") 'org-priority)
    ;; Archive
    (define-key org-mode-map (kbd "<f5> a") 'org-archive-subtree)
    ;; Mobile
    (define-key org-mode-map (kbd "<f5> m g") 'org-mobile-pull)
    (define-key org-mode-map (kbd "<f5> m p") 'org-mobile-push)

    ;; ;; Return word-jumping keys
    ;; (define-key org-mode-map (kbd "M-u") 'backward-word)
    ;; (define-key org-mode-map (kbd "M-o") 'forward-word) ; was (prefix)

    ;; (define-key org-mode-map (kbd "C-M-L") 'org-shiftmetaright)
    ;; (define-key org-mode-map (kbd "C-M-J") 'org-shiftmetaleft)
    )

  ;; ;; Applications -- this does not work (why?)
  ;; (global-unset-key (kbd "<apps> n A"))
  ;; (global-set-key (kbd "<apps> n A") 'org-todo-list)
  )

(ergoemacs-theme krvkir ()
  "Krvkir's Ergoemacs Theme"
  :components '(
                copy
                dired-to-wdired
                execute
                fixed-newline
                help
                kill-line
                misc
                move-bracket
                move-buffer
                move-char
                move-line
                move-page
                move-paragraph
                move-word
                search
                select-items
                switch
                text-transform
                ergoemacs-remaps
                standard-vars
                krvkir-org)
   :optional-on '(apps-punctuation
                  apps-apps
                  apps
                  backspace-del-seq
                  backspace-is-back
                  fn-keys
                  f2-edit
                  fixed-bold-italic
                  standard-fixed
                  ido-remaps
                  helm-remaps
                  multiple-cursors-remaps
                  quit
                  apps-swap
                  save-options-on-exit)
   :optional-off '(guru no-backspace search-reg
                        ergoemacs-banish-shift)
   :options-menu '(("Menu/Apps Key" (apps apps-apps apps-punctuation))
                   ("Function Keys" (fn-keys f2-edit))
                   ("Remaps" (ido-remaps helm-remaps multiple-cursors-remaps))
                   ("Extreme ErgoEmacs" (guru no-backspace ergoemacs-banish-shift))
                   ("Standard Keys" (standard-fixed fixed-bold-italic quit))
                   ("Keys during Key Sequence" (f2-edit apps-swap backspace-del-seq)))

)

(setq ergoemacs-theme "krvkir")
