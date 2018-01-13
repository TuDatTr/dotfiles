
(require 'package)
(add-to-list 'package-archives 
    '("melpa" . "http://melpa.org/packages/"))

(load-theme 'forest-blue t)

(defun copy-to-xclipboard(arg)
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
    (deactivate-mark))))

(defun cut-to-xclipboard(arg)
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
    (kill-region  (region-beginning) (region-end))
    (deactivate-mark))))

(defun paste-from-xclipboard()
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

(defun back-to-indentation-or-beginning () 
"Go back to indentation, if at indentation go to beginning of line"
(interactive)
 (if (= (point) (progn (back-to-indentation) (point)))
     (beginning-of-line)))

(menu-bar-mode -1)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(require 'tex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(require 'ox-twbs)

(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(add-hook 'org-mode-hook 
      '(lambda () 
         (setq org-src-fontify-natively t)))

(ivy-mode 1)

(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#333333")
(set-face-foreground 'highlight nil)

(require 'yasnippet)
(setq yas-snippet-dirs
  '("~/.emacs.d/snippets/"))
(yas-global-mode 1)

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-a") 'back-to-indentation-or-beginning)
    (define-key map (kbd "C-c M-w") 'copy-to-xclipboard)
    (define-key map (kbd "C-c C-w") 'cut-to-xclipboard)
    (define-key map (kbd "C-c M-y") 'paste-from-xclipboard)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)
