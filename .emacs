(package-initialize)

;; Package Repos
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   '("elpy" . "http://jorgenschaefer.github.io/packages/")
   )
  )

;; Copy and Paste
;; https://github.com/Boruch-Baum
(defun my-copy-to-xclipboard(arg)
      (interactive "P")
      (cond
       ((not (use-region-p))
	 (message "Nothing to yank to X-clipboard"))
        ((and (not (display-graphic-p))
	      (/= 0 (shell-command-on-region
		    (region-beginning) (region-end) "xsel -i -b")))
	 (error "Is program `xsel' installed?"))
        (t
	 (when (display-graphic-p)
            (call-interactively 'clipboard-kill-ring-save))
          (message "Yanked region to X-clipboard")
          (when arg
            (kill-region  (region-beginning) (region-end)))
          (deactivate-mark))))
    
(defun my-cut-to-xclipboard()
      (interactive)
      (my-copy-to-xclipboard t))
    
(defun my-paste-from-xclipboard()
      "Uses shell command `xsel -o' to paste from x-clipboard. With
    one prefix arg, pastes from X-PRIMARY, and with two prefix args,
    pastes from X-SECONDARY."
      (interactive)
      (if (display-graphic-p)
	  (clipboard-yank)
	(let*
	   ((opt (prefix-numeric-value current-prefix-arg))
          (opt (cond
		((=  1 opt) "b")
           ((=  4 opt) "p")
           ((= 16 opt) "s"))))
	 (insert (shell-command-to-string (concat "xsel -o -" opt))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" default)))
 '(global-font-lock-mode t)
 '(package-selected-packages (quote (elpy auctex forest-blue-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-bold-face ((t (:foreground "brightcyan"))))
 '(font-latex-sedate-face ((t (:foreground "brightcyan"))))
 '(font-lock-comment-face ((t (:foreground "color-142"))))
 '(font-lock-keyword-face ((t (:foreground "brightcyan" :weight bold))))
 '(font-lock-type-face ((t (:foreground "green")))))


;; Startup
;; Load Theme
(load-theme 'forest-blue t)

;; Python
(elpy-enable)
(defalias 'workon 'pyvenv-workon)
(workon "~/.virtualenv/default")
;; AUCTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; Tex To PDF
(require 'tex)
(TeX-global-PDF-mode t)
;; Yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"  ;; personal snippets/copied ones
	)  
      )

(yas-global-mode t)

;; Custom Keybinds
(global-set-key (kbd "C-c C-w") 'my-cut-to-xclipboard)
(global-set-key (kbd "C-c M-w") 'my-copy-to-xclipboard)
(global-set-key (kbd "C-c M-y") 'my-paste-from-xclipboard)
