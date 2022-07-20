;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((org-hugo-base-dir . "~/proj/cashweaver.com")
         (org-hugo-section . "posts")
         (eval . (setq-local
                  org-roam-capture-templates `(("c" "concept" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+filetags: :concept:\n"))
                                                :unnarrowed t)
                                               ("p" "person" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+filetags: :person:\n"
                                                   "Among other things:\n"
                                                   "* TODO [#4] :noexport:"))
                                                :unnarrowed t)
                                               ("P" "poem" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+filetags: :poem:\n"
                                                   "#+begin_verse\n"
                                                   "#+end_verse\n"))
                                                :unnarrowed t)
                                               ("q" "quote" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+filetags: :quote:\n"
                                                   "#+begin_quote\n"
                                                   "#+end_quote\n"))
                                                :unnarrowed t))
                  org-roam-directory (expand-file-name
                                      (locate-dominating-file
                                       default-directory
                                       ".dir-locals.el"))
                  org-attach-directory (file-truename
                                        (format
                                         "%s/attachments/"
                                         org-roam-directory))
                  org-roam-db-location (expand-file-name
                                        "org-roam.db"
                                        org-roam-directory)
                  org-hugo-auto-set-lastmod t
                  cashweaver/org-roam--file-path-exceptions-to-export-after-save `(,(format "%sunread.org"
                                                                                            org-roam-directory)
                                                                                   ,(format "%sunread.org_archive"
                                                                                            org-roam-directory))
                  cashweaver/org-roam--file-path-exceptions-to-add-bibliography `(,(format "%sunread.org"
                                                                                           org-roam-directory)
                                                                                  ,(format "%sunread.org_archive"
                                                                                           org-roam-directory))))
         (eval .
               (add-hook
                'cashweaver/org-mode-done-cut-hook
                'org-roam-file-p)
               )))

 (org-mode . ((eval . (org-hugo-auto-export-mode))
              (eval . (cashweaver/enable-anki-editor-mode))
              (eval . (setq
                       org-export-with-priority nil
                       org-export-with-todo-keywords nil))
              (eval . (add-hook! 'before-save-hook
                                 :local
                                 #'cashweaver/org-roam-before-save))
              )))
