
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "https://melpa.org/packages/")
)

;; Add themes inside "~/.emacs.d/themes/" to loaded themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'forest-blue t)

(custom-set-faces
 '(font-latex-bold-face ((t (:foreground "brightcyan"))))
 '(font-latex-sedate-face ((t (:foreground "brightcyan"))))
 '(font-lock-comment-face ((t (:foreground "color-142"))))
 '(font-lock-doc-face ((t (:foreground "color-83"))))
 '(font-lock-keyword-face ((t (:foreground "brightcyan" :weight bold))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(highlight-indentation-face ((t (:background "green")))))



(require 'smartparens-config)

(require 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-close-quote "")
(setq TeX-open-quote "")
(setq-default TeX-Master nil)

(add-hook 'org-mode-hook 'smartparens-strict-mode)
