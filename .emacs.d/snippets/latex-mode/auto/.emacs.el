(TeX-add-style-hook
 ".emacs"
 (lambda ()
   (TeX-run-style-hooks
    "INCL/settings"
    "{INCL/tu}"))
 :latex)

