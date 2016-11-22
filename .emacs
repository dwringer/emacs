;;; BASIC UI CUSTOMIZATIONS:
(setq initial-scratch-message "")
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
;;(setq scroll-conservatively 10000)
;;(setq auto-window-vscroll nil)
;;(setq c-basic-offset 8)
(menu-bar-mode 1)
(tool-bar-mode -1)
(column-number-mode t)
(global-prettify-symbols-mode +1)
(setq c-basic-offset 8)
(setq-default truncate-lines t)
(setq-default max-mini-window-height 2)
(add-to-list 'default-frame-alist '(height . 34))
(add-to-list 'default-frame-alist '(width . 86))


;;; SQF MODE:
(add-to-list 'load-path (expand-file-name "~/.emacs.d/sqf-mode"))
(require 'sqf-mode)
(add-to-list 'auto-mode-alist '("\\.sqf\\'" . sqf-mode))


;;; TRANSLUCENCY EFFECT:
(set-frame-parameter (selected-frame) 'alpha '(88 . 62))
(add-to-list 'default-frame-alist '(alpha . (88 . 62)))

;;; EXPANDED PACKAGE MANAGER:
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;; PYTHON MODE CUSTOMIZATION:
;; * NOTE - python.exe should be reachable in the PATH environment variable
;;            for all features to work (like syntax error highlighting)
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;;; SETUP SLIME:
;; * NOTE - sbcl.exe must be reachable in the PATH environment variable
(setq inferior-lisp-program "sbcl.exe")
(slime-setup '(slime-fancy))
(setq slime-lisp-implementations
      '(("sbcl" ("sbcl" "--dynamic-space-size" "12288"))))

;;; RANDOM COLOR THEMES:
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (add-to-list 'load-path
		  (expand-file-name
		   "~/.emacs.d/elpa/solarized-theme-20160901.334/solarized"))
     (add-to-list 'load-path
		  (expand-file-name
		   "~/.emacs.d/elpa/dracula-theme-20160826.627/dracula-theme"))
     (color-theme-initialize)
     (defun load-moe (light)
       (require 'moe-theme)
       (eval-after-load "moe-theme"
	 (if light (moe-light) (moe-dark))))
     (let ((theme-strings '((color-theme-blue-sea)
			    (color-theme-blue-mood)
			    (color-theme-classic)
			    (color-theme-dark-blue2)
			    (color-theme-deep-blue)
			    (color-theme-fischmeister)
			    (color-theme-greiner)
			    (color-theme-infodoc)
			    (color-theme-jonadabian-slate)
			    (color-theme-marquardt)
			    (color-theme-montz)
			    (color-theme-word-perfect)
			    (load-moe t)
			    (load-moe nil)
			    (load-theme 'dracula t)
			    (load-theme 'solarized-dark t)
			    (load-theme 'solarized-light t)
			    (load-theme 'zenburn t)
			    (load-theme 'ubuntu t))))
       (eval (elt theme-strings (random (length theme-strings)))))))

;;; SETUP CONSOLE LINE NUMBERS (AFTER LOADING THEMES!):
(require 'linum)
(eval-after-load "linum"
  '(progn (global-linum-mode t)
	  (set-face-attribute 'linum nil :height 62)))
;; (defun linum-hook nil
;;   (linum-mode 1)
;;   (eval-after-load "linum"
;;     '(set-face-attribute 'linum nil :height 62)))
;; (add-hook 'inferior-python-mode-hook 'linum-hook)  
;; (add-hook 'slime-repl-mode-hook 'linum-hook)
;; (add-hook 'text-mode-hook 'linum-hook)
;; (add-hook 'csv-mode-hook 'linum-hook)
;; (add-hook 'emacs-lisp-mode-hook 'linum-hook)

;;; SPECIAL SYMBOL REWRITES:
(add-hook 'lisp-mode-hook
	  (lambda () (setq prettify-symbols-alist
		      '(("bigalpha"   . 913) ("alpha"   . 945)
			("bigbeta"    . 914) ("beta"    . 946)
			("biggamma"   . 915) ("gamma"   . 947)
			("bigdelta"   . 916) ("delta"   . 948)
			("bigepsilon" . 917) ("epsilon" . 949)
			("bigzeta"    . 918) ("zeta"    . 950)
			("bigeta"     . 919) ("eta"     . 951)
			("bigtheta"   . 920) ("theta"   . 952)
			("bigiota"    . 921) ("iota"    . 953)
			("bigkappa"   . 922) ("kappa"   . 954)
			("biglambda"  . 923) ("lambda"  . 955)
			("bigmu"      . 924) ("mu"      . 956)
			("bignu"      . 925) ("nu"      . 957)
			("bigxi"      . 926) ("xi"      . 958)
			("bigomicron" . 927) ("omicron" . 959)
			("bigpi"      . 928) ("pi"      . 960)
			("bigrho"     . 929) ("rho"     . 961)
			("bigsigma"   . 931) ("sigmaf"  . 962) ("sigma" . 963)
			("bigtau"     . 932) ("tau"     . 964)
			("bigupsilon" . 933) ("upsilon" . 965)
			("bigphi"     . 934) ("phi"     . 966)
			("bigchi"     . 935) ("chi"     . 967)
			("bigpsi"     . 936) ("psi"     . 968)
			("bigomega"   . 937) ("omega"   . 969)
			("member"          . 8712)
			("proper-subset"   . 8834)
			("proper-superset" . 8835)
			("subset"   . 8838)
			("superset" . 8839)
			("union" . 8746)
			("intersection" . 8745)
			(">=" . 8805) ("<= " . 8804)
			("neq" . 8800) ))))  ;("map" . 8614)

;;; SET FONT FACE (AFTER LOADING THEMES!):
(cond
 ((find-font (font-spec :name "Artesian"))
  (set-face-attribute 'default nil :font "Artesian-11"))
 ((find-font (font-spec :name "Consolas"))
  (set-face-attribute 'default nil :font "Consolas-11"))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono-11"))
 ((find-font (font-spec :name "inconsolata"))
  (set-face-attribute 'default nil :font "inconsolata-11"))
 t nil)

;;; CROSS-PLATFORM LINE ENDING COMPATIBILITY:
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;; NON-USER-EDITABLE!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," "	")))
 '(custom-safe-themes
   (quote
    ("3d5307e5d6eb221ce17b0c952aa4cf65dbb3fa4a360e12a71e03aab78e0176c5"
     "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879"
     "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
     "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194"
     "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55"
     "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856"
     default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
