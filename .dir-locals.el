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
                                               ("d" "default" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "* TODO"))
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
                                                   "* TODO"))
                                                :unnarrowed t)
                                               ("P" "poem" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+filetags: :poem:\n"))
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
                                                   "TODO_QUOTE\n"
                                                   "\n"
                                                   "/[[https:foo][source]]/\n"
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
                  org-hugo-auto-set-lastmod t
                  cashweaver/org-roam--file-path-exceptions-to-export-after-save `(,(format "%sunread.org"
                                                                                            org-roam-directory)
                                                                                   ,(format "%sunread.org_archive"
                                                                                            org-roam-directory))
                  cashweaver/org-roam--file-path-exceptions-to-add-bibliography `(,(format "%sunread.org"
                                                                                           org-roam-directory)
                                                                                  ,(format "%sunread.org_archive"
                                                                                           org-roam-directory))))
         (eval . (setq-local
                  org-roam-db-location (expand-file-name
                                        "org-roam.db"
                                        org-roam-directory)))))

 (org-mode . ((eval . (org-hugo-auto-export-mode))
              (eval . (anki-editor-mode t))
              (eval . (add-hook!
                       'before-save-hook
                       :local
                       #'cashweaver/org-roam-rewrite-smart-to-ascii))
              (eval . (add-hook!
                       'before-save-hook
                       :local
                       #'cashweaver/org-roam-mirror-roam-refs-to-front-matter))
              (eval . (add-hook!
                       'before-save-hook
                       :local
                       #'cashweaver/org-roam-add-bibliography))
              (eval . (add-hook!
                       'before-save-hook
                       :local
                       #'cashweaver/org-roam-add-anki))
              (eval . (add-hook!
                       'before-save-hook
                       :local
                       #'anki-editor-push-notes))
              )))
