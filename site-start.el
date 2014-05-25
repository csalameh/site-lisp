;;http://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html
;; activated debug messages
(setq debug-on-error t)
(setq message-log-max t)

(setq default-directory "D:/ToolsAndUtilities/tools/emacs-24/site-lisp")
(setq user-emacs-directory "D:/ToolsAndUtilities/tools/emacs-24/site-lisp")
(setq diary-file "D:/ToolsAndUtilities/tools/emacs-24/site-lisp")

;; Start emacs as a server
(require 'server)
(or (server-running-p) 
	(server-start))


;; This sets up the load path so that we can override it
(package-initialize nil)

;(setq url-proxy-services
 ;               '(("http"     . "proxylb:3128")
 ;                 ("no_proxy" . "^.*\\(murex\\)\\.com")))
				  
;; Override the packages with the git version of Org
(add-to-list 'load-path "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org-mode/lisp")
(add-to-list 'load-path "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/org-mode/contrib/lisp")


;; disable welcome screen
(setq inhibit-startup-screen t)
;; open scratch buffer by default
(setq initial-buffer-choice t)
;; full screen
;; (require 'w32-fullscreen)
;; (w32-fullscreen)
(setq tramp-default-method "plink")

;; Load the rest of the packages
(package-initialize t)
(require 'org)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "D:/ToolsAndUtilities/tools/emacs-24/site-lisp/csalamehInit.org"))


