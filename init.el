  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (xterm-mouse-mode -1)

  ;; Enabled Agenda Mode
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)


  (setq locale-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (when (display-graphic-p)
    (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))


  ;; Enable Caputre Templates

  (define-key global-map "\C-cc" 'org-capture)
  ;; Custom Caputre Templates
  (setq org-capture-templates
        '(
          ("p" "Project" entry (file+headline "~/org/inbox.org" "Projects")
           "** Project: %?\n %U\n  %i\n*** Requirements  \n*** Questions \n*** Tasks  %a")
          ("m" "Meeting" entry (file+headline "~/org/inbox.org" "Meetings")
           "** WITH: %?\n%U\n  %i\n*** Agenda\n  * \n*** Questions \n  *  %a")
          ("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))


  ;; Update Agenda Buffer every X seconds.

  (defun renewOrgBuffer ()
    (interactive)
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (derived-mode-p 'org-agenda-mode)
          (org-agenda-maybe-redo))))
    )

  (run-with-idle-timer 3 1000 #'renewOrgBuffer)


  (setq org-todo-keywords '(
                            (sequence "☛ TODO(t)" "|" "🔧 IN PROGRESS(i)" "|" "✔ DONE(d)")
                            (sequence "⚑ WAITING(w)" "|")
                            (sequence "🐛 BUG(b)" "|")
                            (sequence "✉️  MAILED(m)" "|")
                            (sequence "❓ QUESTION(q)" "|")
                            (sequence "|" "✘ CANCELED(c)")
                            ))
                      

        
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (awk . t)
       (calc .t)
       (C . t)
       (emacs-lisp . t)
       (haskell . t)
       (gnuplot . t)
       (latex . t)
       (ledger . t)
       (js . t)
       (haskell . t)
       (perl . t)
       (python . t)
       ;; (gnuplot . t)
       ;; org-babel does not currently support php.  That is really sad.
       ;;(php . t)
       (R . t)
       (scheme . t)
       (http . t)
       (sql . t)
       (shell . t)
       ;;(sqlite . t)
       ))