(require 'mu4e)
(require 'org-mu4e)

(setq message-send-mail-function 'smtpmail-send-it)

;; default
(setq mu4e-maildir (expand-file-name "~/Mail"))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")
;; set html2text converter
(setq mu4e-html2text-command "python ~/bin/html2markdown")

;; Define some bookmarks
(setq mu4e-bookmarks
      '(
        ("date:today..now"                  "Today's messages"     ?t)

        ("flag:unread AND NOT flag:trashed" "Unread messages"      ?u)
        ("tag:\\\\Inbox"        "\\Inbox"?i)
        ("tag:\\\\Sent"         "\\Sent" ?s)
        ("tag:\\\\Important"    "\\Important" ?m)
        ("tag:\\\\Starred"      "\\Starred" ?t)

        
        ("date:7d..now"                     "Last 7 days"          ?w)
        ("flag:unread date:7d..now AND NOT flag:trashed" "Last 7 days, unread"?U)
        ("tag:\\\\Inbox date:7d..now"       "Last 7 days: \\Inbox"     ?I)
        ("tag:\\\\Sent date:7d..now"        "Last 7 days: \\Sent"      ?S)

        ("tag:learning*"                    "Label: Learning" ?l)
        ("tag:announcements*"               "Label: Announcements" ?n)
        ("tag:ads*"                         "Label: Ads"           ?d)
        ("tag:subscribes*"                  "Label: Subscribes"    ?b)

        ("mime:image/*"                     "Messages with images" ?p)
        )
      )

             

;;;;;;;;;;;;;;;;;;;;
;; Main account
(setq mu4e-sent-folder "/krvkir@gmail.com/[Gmail].All Mail"
      mu4e-drafts-folder "/krvkir@gmail.com/[Gmail].Drafts"
      user-mail-address "krvkir@gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-local-domain "gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 25
      mu4e-sent-messages-behavior 'delete
      )

;;;;;;;;;;;;;;;;;;;;
;; Multiple accounts

(setq my-mu4e-account-alist
  '(("krvkir@gmail.com"
     (mu4e-sent-folder "/krvkir@gmail.com/[Gmail].All Mail")
     (mu4e-drafts-folder "/krvkir@gmail.com/[Gmail].Drafts")
     (user-mail-address "krvkir@gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-local-domain "gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-stream-type 'starttls)
     (smtpmail-smtp-service 25)
     (mu4e-sent-messages-behavior 'delete)
     )
    ("krasnoschekov@opentechnology.ru"
     (mu4e-sent-folder "/krasnoschekov@opentechnology.ru/[Gmail].All Mail")
     (mu4e-drafts-folder "/krasnoschekov@opentechnology.ru/[Gmail].Drafts")
     (user-mail-address "krasnoschekov@opentechnology.ru")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-local-domain "gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-stream-type 'starttls)
     (smtpmail-smtp-service 25)
     (mu4e-sent-messages-behavior 'delete)
     )
    ("k.krsnv@yandex.ru"
     (mu4e-sent-folder "/k.krsnv@yandex.ru/Sent")
     (mu4e-drafts-folder "/k.krsnv@yandex.ru/Drafts")
     (user-mail-address "k.krsnv@yandex.ru")
     (smtpmail-default-smtp-server "smtp.yandex.ru")
     (smtpmail-local-domain "yandex.ru")
     (smtpmail-smtp-server "smtp.yandex.ru")
     (smtpmail-stream-type 'starttls)
     (smtpmail-smtp-service 25)
     (mu4e-sent-messages-behavior 'delete)
     )
    ))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Fixing a bug in mu4e~compose-setup-fcc-maybe?

;; (defun mu4e~compose-setup-fcc-maybe ()
;;   "Maybe setup Fcc, based on `mu4e-sent-messages-behavior'.
;; If needed, set the Fcc header, and register the handler function."
;;   (let* ((sent-behavior
;; 	   ;; Note; we cannot simply use functionp here, since at least
;; 	   ;; delete is a function, too...
;; 	   (if (member mu4e-sent-messages-behavior '(delete trash sent))
;; 	     mu4e-sent-messages-behavior
;; 	     (if (functionp mu4e-sent-messages-behavior)
;; 	       (funcall mu4e-sent-messages-behavior)
;; 	       mu4e-sent-messages-behavior)))
;; 	  (mdir
;; 	    (case sent-behavior
;; 	      ('delete nil)
;; 	      ('trash (mu4e-get-trash-folder mu4e-compose-parent-message))
;; 	      ('sent (mu4e-get-sent-folder mu4e-compose-parent-message))
;; 	      (otherwise
;; 		(mu4e-error "unsupported value '%S' `mu4e-sent-messages-behavior'."
;; 		  mu4e-sent-messages-behavior))))
;; 	  (fccfile (and mdir
;; 		     (concat mu4e-maildir mdir "/cur/"
;; 		       (mu4e~draft-message-filename-construct "S")))))
;;     ;; if there's an fcc header, add it to the file
;;     (when fccfile
;;       (message-add-header (concat "Fcc: " fccfile "\n"))
;;       ;; sadly, we cannot define as 'buffer-local'...  this will screw up gnus
;;        ;; etc. if you run it after mu4e so, (hack hack) we reset it to the old
;;        ;; handler after we've done our thing.
;;       (setq message-fcc-handler-function
;; 	(lexical-let ((maildir mdir) (old-handler message-fcc-handler-function))
;; 	  (lambda (file)
;; 	    (setq message-fcc-handler-function old-handler) ;; reset the fcc handler
;; 	    (write-file file)		       ;; writing maildirs files is easy
;; 	    (mu4e~proc-add file (or maildir "/")))))))) ;; update the database
