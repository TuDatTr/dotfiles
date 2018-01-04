;;; package --- summary
;;; Code:
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
;;; Commentary:
;; Functions
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


(defun pyexec ()
  "Execute the python program in an external terminal."
  (interactive)
  (when buffer-file-name
    (shell-command (concat "termite --hold -e \"python " buffer-file-name "\""))
    )
  )

(defun cppexec ()
  "Execute the python program in an external terminal."
  (interactive)
  (when buffer-file-name
    (shell-command (concat "termite -e \"g++ " buffer-file-name "\""))
    (shell-command (concat "termite --hold -e \"./a.out\""))
    )
  )

;; Latex
(fset 'next-section
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\\sec" 0 "%d")) arg)))
(fset 'prev-section
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\\sec" 0 "%d")) arg)))

;; Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" default)))
 '(elpy-dedicated-shells t)
 '(elpy-shell-display-buffer-after-send t)
 '(global-font-lock-mode t)
 '(package-selected-packages
   (quote
    (auto-complete nyan-mode google-this dummyparens flycheck rainbow-mode elpy auctex forest-blue-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-bold-face ((t (:foreground "brightcyan"))))
 '(font-latex-sedate-face ((t (:foreground "brightcyan"))))
 '(font-lock-comment-face ((t (:foreground "color-142"))))
 '(font-lock-doc-face ((t (:foreground "color-83"))))
 '(font-lock-keyword-face ((t (:foreground "brightcyan" :weight bold))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(highlight-indentation-face ((t (:background "green")))))


;; Startup
;; Load Theme
(load-theme 'forest-blue t)
;; General stuff
(show-paren-mode 1)
(menu-bar-mode -1)
;; Python
(elpy-enable)
(defalias 'workon 'pyvenv-workon)
(workon "~/.virtualenv/default")
(eval-after-load 'elpy
  '(define-key elpy-mode-map (kbd "C-c C-c") 'pyexec)
  )
;; C++
(eval-after-load 'cc-mode
  '(define-key c++-mode-map (kbd "C-c C-c") 'cppexec))
;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c n") 'next-section))
(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c p") 'prev-section))
;; Tex To PDF
(require 'tex)
(TeX-global-PDF-mode t)
;; Yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"  ;; personal snippets/copied ones
	)
      )
(yas-global-mode t)
;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;; dummyparents
(eval-after-load "dummyparens-autoloads"
  '(progn
     (if (require 'dummyparens nil t)
         (global-dummyparens-mode)
       (warn "dummyparens not found"))))
;; Google-this
(google-this-mode 1)
;; Nyan-Mode
(nyan-mode 1)

;; Custom Keybinds
(global-set-key (kbd "C-c C-w") 'my-cut-to-xclipboard)
(global-set-key (kbd "C-c M-w") 'my-copy-to-xclipboard)
(global-set-key (kbd "C-c M-y") 'my-paste-from-xclipboard)
(global-set-key (kbd "C-x g") 'google-this-mode-submap)

(provide '.emacs)
;;; .emacs ends here
