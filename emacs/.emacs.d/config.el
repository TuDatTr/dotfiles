
(require 'package)
(add-to-list 'package-archives 
    '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package aggressive-indent)
(use-package anaconda-mode)
(use-package auto-complete)
(use-package auto-complete-auctex
:defer t
:ensure t)
(use-package auctex
:defer t
:ensure t)
(use-package counsel)
(use-package eclim)
(use-package flycheck)
(use-package google-this)
(use-package ivy)
(use-package material-theme)
(use-package ox-twbs)
(use-package rainbow-delimiters)
(use-package rainbow-mode)
(use-package smartparens)
(use-package swiper)
(use-package yasnippet)

(load-theme 'material t)

(add-hook 'window-setup-hook 
      '(lambda () 
         (set-face-background 'default "unspecified-bg")))

(f-mkdir "~/.emacs-saves")
(setq auto-save-file-name-transforms
  '((".*" "~/.emacs-saves/" t)))

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

(defun transparent-terminal ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(menu-bar-mode -1)

(ac-config-default)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(require 'tex)
(require 'auto-complete-auctex)
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

(add-hook 'org-mode-hook 
      '(lambda ()
         (setq org-pretty-entities t)))

(add-hook 'org-mode-hook 'rainbow-delimiters-mode)

(counsel-mode 1)
(global-set-key "\C-s" 'swiper)

(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode 1)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#141b1e")
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

(add-hook 'conf-mode 'rainbow-mode)
