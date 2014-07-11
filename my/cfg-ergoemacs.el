(ergoemacs-theme-component :name "krvkir-global"
  :description "Krvkir's Org customizations" 

  ;; (when org-mode-hook
  ;;   (define-key org-mode-map (kbd "M-u") 'backward-word)
  ;;   (define-key org-mode-map (kbd "M-o") 'forward-word)
  ;;   )

  ;; Applications
  (global-unset-key (kbd "<apps> n A"))
  (global-set-key (kbd "<apps> n A") 'org-todo-list)

  (global-unset-key (kbd "<f4>"))
  )

(ergoemacs-theme krvkir ()
  "KrvKir's Ergoemacs Theme"
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
                )
  :optional-on '(
                 krvkir-global
                 apps-punctuation
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
                 save-options-on-exit
                 )
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
;; (ergoemacs-debug-obj (ergoemacs-theme-get-obj "krvkir"))
