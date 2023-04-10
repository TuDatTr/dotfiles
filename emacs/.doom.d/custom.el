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
("i" "ieee paper" plain "
#+title: %^{title}
#+OPTIONS: toc:nil author:nil
#+LaTeX_CLASS: paper
# LaTeX_HEADER: \\documentclass[12pt,a4paper,conference,final,twoside]{IEEEtran}
#+LaTeX_HEADER: \\title{%^{title}}
#+LaTeX_HEADER: \\author{\\IEEEauthorblockN{Tuan-Dat Tran\\\\\\small(3030462)}\\\\\\IEEEauthorblockA{University of Duisburg-Essen\\\\tuan-dat.tran@stud.uni-due.de}}
#+LaTeX_HEADER: \\usepackage[utf8]{inputenc}
#+LaTeX_HEADER: \\usepackage[T1]{fontenc}
#+LaTeX_HEADER: \\usepackage{lmodern}
#+LaTeX_HEADER: \\usepackage[english]{babel}
#+LaTeX_HEADER: \\usepackage[backend=biber,doi=true,url=true,block=ragged,maxnames=6]{biblatex}
#+LaTeX_HEADER: \\renewcommand*{\\bibfont}{\\footnotesize}
#+LaTeX_HEADER: \\pagestyle{plain}
#+LaTeX_HEADER: \\usepackage{siunitx}
#+LaTeX_HEADER: \\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
#+LaTeX_HEADER: \\usepackage{cleveref}
#+LaTeX_HEADER: \\usepackage{graphicx}
#+LaTeX_HEADER: \\graphicspath{{./images/}}
#+LaTeX_HEADER: \\usepackage{csquotes}
#+LaTeX_HEADER: \\MakeOuterQuote{\"}
#+LaTeX_HEADER: \\usepackage{balance}
#+LaTeX_HEADER: \\clubpenalty10000
#+LaTeX_HEADER: \\widowpenalty10000
#+LaTeX_HEADER: \\usepackage{listings}
#+LaTeX_HEADER: \\definecolor{lstgreen}{rgb}{0,0.6,0}
#+LaTeX_HEADER: \\lstset{language=C,%basicstyle=\\scriptsize\\sourcecodepro,%basicstyle=\\scriptsize\\ttfamily,basicstyle=\\linespread{1.1}\\scriptsize\\ttfamily,commentstyle=\\color{lstgreen},keywordstyle=\\color{blue},keywordstyle=[2]\\color{SlateBlue},keywordstyle=[3]\\color{DarkCyan},keywordstyle=[4]\\color{violet},%ndkeywordstyle=\\color{violet},emphstyle=\\bfseries\\color{DarkGray},identifierstyle=\\color{black},commentstyle=\\color{purple}\\ttfamily,stringstyle=\\color{gray}\\ttfamily,%numbers=left,numbers=left,numberstyle=\\tiny,columns=fullflexible,keepspaces=true,showstringspaces=false,captionpos=b,%xleftmargin=\\parindent,%framexleftmargin=\\parindent,%xleftmargin=2cm,%linewidth=\\textwidth,%xleftmargin=2cm,xleftmargin=2em,%xleftmargin=3pt,xrightmargin=3pt,%aboveskip=\\bigskipamount,%belowskip=\\bigskipamount,%fancyvrb=true,frame=single,%frame=L,escapechar=@,}
#+LaTeX_HEADER: \\lstdefinestyle{plain}{  numbers=none,frame=none,xleftmargin=1pt,xrightmargin=1pt,}
#+LaTeX_HEADER: \\crefname{lstlisting}{listing}{listing}
#+LaTeX_HEADER: \\Crefname{lstlisting}{Listing}{Listings}
#+LaTeX_HEADER: \\usepackage{blindtext}
#+LaTeX_HEADER: \\newcommand\\blindsection{{\\color{gray}\\subsection{Some bind text}\\blindtext}}

%?
" :target
(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}
#+filetags: paper")
:unnarrowed t)
     ("p" "paper notes" plain "* Authors
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
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("paper"
               "\\documentclass[12pt,a4paper,conference,final,twoside]{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

