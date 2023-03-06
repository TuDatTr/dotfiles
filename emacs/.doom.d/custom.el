(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hugo-base-dir "~/Documents/hugo/")
 '(org-roam-capture-templates
   '(("d" "default" plain "* Description
%?

* Resources
- " :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
:unnarrowed t)
     ("r" "Code Implementation" plain "* Description
%?

* Methods

** TODO <Name>

*** Description

*** Code

* Resources
- " :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
#+filetags: code")
:unnarrowed t)
     ("t" "Rust Traits" plain "* Description
%?

* Notable Implementations/Subtraits



* Methods

** TODO <Name>

*** Description

*** Code

* Resources
- " :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
#+filetags: rust-trait")
:unnarrowed t)
     ("P" "project" plain "* Project Overview
- Type: %^{Project Type}
- Project Partners:
  - %?

* Project Description

* Tasks

** TODO Add initial taks

* Sprints

**
" :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
#+filetags: project")
:unnarrowed t)
     ("p" "paper" plain "* Authors
- %?

* Index Terms
- 

* Short Summary
" :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
#+filetags: paper")
:unnarrowed t)
     ("l" "programming language" plain "* Description
%?

* Programming Language Properties
- 

* Benefits
-

* Examples
** Hello World
#+begin_src ${title}
#+end_src
" :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
:unnarrowed t)
     ("L" "lecture" plain "- Lecture: ${title}
- Lecturer: %^{Docent}
- Research Group: %^{Research Group}
* Description
" :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
:unnarrowed t nil nil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
