(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(ledger-reports
   '(("privatausgaben" "%(binary) -f %(ledger-file) reg Girokonto and not expr 'any(account =~ /Unternehmenskosten|Versicherung|Wohnungskosten|Gemeinschaftskonto|LiviaE/)' and not @Umbuchung and not @Kleingeld --period 'this month'")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(org-export-backends '(ascii html latex md odt))
 '(package-selected-packages
   '(auctex-latexmk flycheck-rust ansible yasnippet use-package theme-magic rainbow-mode rainbow-delimiters ox-twbs ox-reveal ox-hugo org-bullets no-littering moe-theme magit ivy-prescient htmlize god-mode go-mode flycheck evil-collection diminish counsel company auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
