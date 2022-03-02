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
                                                   "#+startup: overview\n"
                                                   "#+filetags: :concept:\n"
                                                   "#+hugo_auto_set_lastmod: t\n"))
                                                :unnarrowed t)
                                               ("d" "default" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+startup: overview\n"
                                                   "#+hugo_auto_set_lastmod: t\n"
                                                   "* TODO"))
                                                :unnarrowed t)
                                               ("p" "person" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+startup: overview\n"
                                                   "#+filetags: :person:\n"
                                                   "#+hugo_auto_set_lastmod: t\n"
                                                   "Among other things:\n"
                                                   "* TODO"))
                                                :unnarrowed t)
                                               ("q" "quote" plain "%?" :target
                                                (file+head
                                                 "${slug}.org"
                                                 ,(concat
                                                   "#+title: ${title}\n"
                                                   "#+author: Cash Weaver\n"
                                                   "#+date: [%<%Y-%m-%d %a %H:%M>]\n"
                                                   "#+startup: overview\n"
                                                   "#+filetags: :quote:\n"
                                                   "#+hugo_auto_set_lastmod: t\n"
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
                                         org-roam-directory))))
         (eval . (setq-local
                  org-roam-db-location (expand-file-name
                                        "org-roam.db"
                                        org-roam-directory)))))

 (org-mode . ((eval . (org-hugo-auto-export-mode))
              (eval . (add-hook! 'before-save-hook
                                 :local
                                 #'cashweaver/org-roam--rewrite-smart-to-ascii))
              (eval . (add-hook! 'before-save-hook
                                 :local
                                 #'cashweaver-org-roam--mirror-roam-refs-to-front-matter))
              (eval . (add-hook! 'before-save-hook
                                 :local
                                 #'cashweaver-org-roam--add-bibliography)))))
