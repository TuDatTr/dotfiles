;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   '("elpy" . "http://jorgenschaefer.github.io/packages/")
   ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-solarized elpy forest-blue-theme)))
 '(pyvenv-activate "~/.virtualenv/default")
 '(tex-run-command "pdflatex")
 '(texinfo-tex-command "pdflatex"))

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

(global-set-key (kbd "C-c C-w") 'my-cut-to-xclipboard)
(global-set-key (kbd "C-c M-w") 'my-copy-to-xclipboard)
(global-set-key (kbd "C-c M-y") 'my-paste-from-xclipboard)

(load-theme 'forest-blue t)
(elpy-enable)
(setq TeX-PDF-mode t)
(setq latex-run-command "pdflatex")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-context ((t (:foreground "brightblack"))))
 '(highlight-indentation-face ((t (:inherit nil :background "brightblack")))))
