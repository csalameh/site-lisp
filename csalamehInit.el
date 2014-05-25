
(setq default-directory "D:/ToolsAndUtilities/tools/emacs-24/site-lisp")
(setq user-emacs-directory "D:/ToolsAndUtilities/tools/emacs-24/site-lisp")
(setq diary-file "D:/ToolsAndUtilities/tools/emacs-24/site-lisp")

(setq debug-on-error t)
(setq message-log-max t)
(setenv "PATH"
(concat
"D:/ToolsAndUtilities/tools/emacs-24/site-lisp/graphviz/release/bin" ";"
"D:/ToolsAndUtilities/tools/GnuWin32/GetGnuWin32Install/bin" ";"
(getenv "PATH")
)
)
(setenv "GRAPHVIZ_DOT"
(concat
"D:/ToolsAndUtilities/tools/emacs-24/site-lisp/graphviz/release/bin/dot.exe"
)
)
(setenv "DICTIONARY"
(concat
"D:/ToolsAndUtilities/tools/emacs-24/site-lisp/ispell/english.hash"
)
)

;; Content of .emacs
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(case-fold-search t)
'(current-language-environment "Latin-1")
'(default-input-method "latin-1-prefix")
'(eshell-modify-global-environment t)
'(eshell-prefer-lisp-variables t)
'(menu-bar-mode t nil (menu-bar))
;'(org-agenda-files nil)
'(show-paren-mode t nil (paren))
'(tool-bar-mode nil nil (tool-bar))
'(toolbar-visible-p nil))
(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
)

;; End content of .emacs

;;C:\Users\<username>\AppData\Roaming\.emacs.d\init.el
;;http://ergoemacs.org/emacs/emacs_installing_packages.html
;;http://ergoemacs.org/emacs/emacs_package_system.html
;;http://www.damtp.cam.ac.uk/user/sje30/emacs/ell-date.html
;;Emacs Lisp List - Problem: I see dead people (links). http://www.damtp.cam.ac.uk/user/sje30/emacs/ell.html
;;Emacswiki - Problem: May contain traces of nuts (malicious code). http://www.emacswiki.org/
;;Emacsmirror - The package repository I am working on. Problem: No package manager supports it natively yet. https://github.com/emacsmirror

;;setup proxy
;;(setq url-proxy-services
;;'(("http"     . "proxylb:3128")
;;("no_proxy" . "^.*\\(murex\\)\\.com")))
;; Define packages to be installed on start up.

(setq package-user-dir "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/elpa")
(setq package-directory-list
(list (file-name-as-directory package-user-dir)
"D:/ToolsAndUtilities/tools/emacs-24/site-lisp/elpa"))
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))


;;date-calc.el - Date calculation and parsing routines.
;;ell.el - Browse the Emacs Lisp List.
;;elm.el, elx.el, xpkg.el - Used to maintain the Emacsmirror.
;;genauto.el - Helps generate autoloads for your elisp packages.
;;inversion.el - Require specific package versions.
;;loadhist.el, lib-requires.el, elisp-depend.el - Commands to list Emacs Lisp library dependencies.
;;project-root.el - Define a project root and take actions based upon it.
;;strptime.el - Partial implementation of POSIX date and time parsing.
;;wikirel.el - Visit relevant pages on the Emacs Wik      
(defvar my-packages '(cl-lib
color-theme
color-theme-solarized
tangotango-theme
bbdb
evil
ggtags
highlight-parentheses
magit
markdown-mode
;;                    org
;;                    org-plus-contrib
markdown-mode+
smex
ox-reveal
undo-tree
auto-complete
auto-complete-pcmp
 flyspell 
yasnippet
;groovy-mode
)
"A list of packages to ensure are installed at launch.")    
(dolist (p my-packages)
(when (not (package-installed-p p))
(package-install p)))

;; specify default browser
(setq browse-url-browser-function 'browse-url-w3)

;; disable vc to prevent hooks by svn
(setq vc-handled-backends nil)

;; display scrollbar
(scroll-bar-mode t)

;; display menu
(menu-bar-mode t)
(tool-bar-mode -1)

;; colortheme tangotango
(require 'tangotango-theme)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-everywhere t)
(ido-mode t)
(setq default-frame-alist
'((top . 200) (left . 400)
(width . 80) (height . 40)
(cursor-type . box)
(font . "Consolas-12")))

(defun dont-kill-emacs()
"Disable C-x C-c binding execute kill-emacs."
(interactive)
(error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)

(custom-set-variables
'(case-fold-search t)
'(current-language-environment "Latin-1")
'(default-input-method "latin-1-prefix")
'(menu-bar-mode t nil (menu-bar))
'(show-paren-mode t nil (paren))
'(tool-bar-mode nil nil (tool-bar))
'(toolbar-visible-p nil))
(fset 'yes-or-no-p 'y-or-n-p)
(setq transient-mark-mode t)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)
(setq column-number-mode t)
(setq line-number-mode t)
(setq inhibit-startup-message t)
(setq fill-column 130)
;; (kill-whole-line t)
(setq tab-width 4)
(setq hilight-paren-expression t)
(if (fboundp 'global-font-lock-mode)
(global-font-lock-mode 1)
(setq font-lock-auto-fontify t))
(setq font-lock-mode-maximum-decoration t)

;; ==============================================
;;;Loading orgmode
;;; Org Mode
;(add-to-list 'load-path (expand-file-name "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org-mode/lisp"))
(add-to-list 'load-path "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org-plus-contrib" t)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

(let ((base "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org"))

(add-to-list 'load-path base)
(dolist (f (directory-files base))
(let ((name (concat base "/" f)))
(when (and (file-directory-p name) 
(not (equal f ".."))
(not (equal f ".")))
(add-to-list 'load-path name)))))

;; ediff customization
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; yasnippets
;;(require 'yasnippet) ;; not yasnippet-bundle
;;(yas/initialize)
;;(yas/load-directory (expand-file-name (concat exec-directory "d:/ToolsAndUtilities/tools/emacs-24/site-lisp/yasnippet/snippets")))
;(defun yas/org-very-safe-expand ()
; (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;;(add-hook 'org-mode-hook
;;         (lambda ()
;;          ;; yasnippet (using the new org-cycle hooks)
;;         (make-variable-buffer-local 'yas/trigger-key)
;;        (setq yas/trigger-key [tab])
;;       (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
;;      (define-key yas/keymap [tab] 'yas/next-field)))

(defun eshell/op (FILE)
"Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes"
(w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE)))) 

;; fancy transparency
(defun djcb-opacity-modify (&optional dec)
"modify the transparency of the emacs frame; if DEC is t,
decrease the transparency, otherwise increase it in 10%-steps"
(let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
(oldalpha (if alpha-or-nil alpha-or-nil 100))
(newalpha (if dec (- oldalpha 5) (+ oldalpha 5))))
(when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
(modify-frame-parameters nil (list (cons 'alpha newalpha))))))

;; C-8 will increase opacity (== decrease transparency)
;; C-9 will decrease opacity (== increase transparency
;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)(modify-frame-parameters nil `((alpha . 100)))))
;;(load (concat exec-directory "sandbox.el"))

(setq org-user-agenda-files (quote ("D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org"
                               "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org/clients"
                               "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org/agenda"
                                 )))

(org-babel-load-file (expand-file-name "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org-mode.org"))
