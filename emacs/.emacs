;;; package --- summary
;; auctex -- installed -- Integrated environment for *TeX*
;; dummyparens -- installed -- paranthesis auto-pairing and wrapping
;; elpy -- installed -- Emacs Python Development Environment
;; flycheck -- installed -- On-the-fly syntax checking
;; forest-blue-theme -- installed -- Emacs theme with a dark background
;; google-this -- installed -- A set of functions and bindings to google under point
;; nyan-mode -- installed -- Nyan Cat shows position in current buffer in mode-line.
;; rainbow-mode -- installed -- Colorize color names in buffers
;; company -- dependency -- Modular text completion framework
;; dash -- dependency -- A modern list library for Emacs
;; epl -- dependency -- Emacs Package Library
;; find-file-in-project -- dependency -- Find file/directory for review Diff/Patch/Commit efficiently everywhere
;; highlight-indentation -- dependency -- Minor modes for highlight indentation
;; ivy -- dependency -- Incremental Vertical completYon
;; pkg-info -- dependency -- Information about packages
;; popup -- dependency -- Visual Popup User Interface
;; pyvenv -- dependency -- Python virtual environment interface
;; s -- dependency -- The long lost Emacs string manipulation library.
;; yasnippet -- dependency -- Yet another snippet extension for Emacs.

;;; Code:
(package-initialize)

;; Package Repos
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   '("elpy" . "http://jorgenschaefer.github.io/packages/")
   )
  )
;; Global functions

; Copy and Paste
; https://github.com/Boruch-Baum
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

;; Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" default)))
 '(dp-pairs
   (quote
    (("(" ")" nil)
     ("[" "]" nil)
     ("{" "}" dp-brace-post-handler))))
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


;; Functions:
; Load Theme
(load-theme 'forest-blue t)

; Python
(elpy-enable)
(defalias 'workon 'pyvenv-workon)
(workon "~/.virtualenv/default")

(defun pyexec ()
  "Execute the python program in an external terminal."
  (interactive)
  (when buffer-file-name
    (shell-command (concat "termite --hold -e \"python " buffer-file-name "\""))
    )
  )

; C++
(defun cppexec ()
  "Execute the cpp program in an external terminal."
  (interactive)
  (when buffer-file-name
    (shell-command (concat "termite -e \"g++ " buffer-file-name "\""))
    (shell-command (concat "termite --hold -e \"./a.out\""))
    )
  )

; LaTeX
(require 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(fset 'next-section
      (lambda (&optional arg) "Next section." (interactive "p") (kmacro-exec-ring-item (quote ("\\sec" 0 "%d")) arg)))
(fset 'prev-section
      (lambda (&optional arg) "Previous section" (interactive "p") (kmacro-exec-ring-item (quote ("\\sec" 0 "%d")) arg)))

; Yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"  ;; personal snippets/copied ones
	)
      )

;; Modes
(show-paren-mode 1)
(menu-bar-mode -1)
(google-this-mode 1)
(nyan-mode 1)
(TeX-global-PDF-mode t)
(yas-global-mode t)
(global-dummyparens-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Custom Keybinds
(global-set-key (kbd "C-c C-w") 'my-cut-to-xclipboard)
(global-set-key (kbd "C-c M-w") 'my-copy-to-xclipboard)
(global-set-key (kbd "C-c M-y") 'my-paste-from-xclipboard)
(global-set-key (kbd "C-x g") 'google-this-mode-submap)
(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c n") 'next-section))
(eval-after-load 'latex
  '(define-key LaTeX-mode-map (kbd "C-c p") 'prev-section))
(eval-after-load 'cc-mode
  '(define-key c++-mode-map (kbd "C-c C-c") 'cppexec))
(eval-after-load 'elpy
  '(define-key elpy-mode-map (kbd "C-c C-c") 'pyexec)
  )

;;; Commentary:

(provide '.emacs)
;;; .emacs ends here
