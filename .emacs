;;; BASIC UI CUSTOMIZATIONS:
(setq initial-scratch-message "")
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
;;(setq scroll-conservatively 10000)
;;(setq auto-window-vscroll nil)
;;(setq c-basic-offset 8)
(defun random-bar-select ()
  (elt '(-1 t) (random 2)))
(menu-bar-mode (random-bar-select))
(tool-bar-mode (random-bar-select))
(column-number-mode t)
(global-prettify-symbols-mode +1)
(setq c-basic-offset 8)
(setq-default truncate-lines t)
(setq-default max-mini-window-height 2)
(add-to-list 'default-frame-alist '(height . 34))
(add-to-list 'default-frame-alist '(width . 86))


;;; INDIVIDUAL EL FILES:
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/el"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el"))
;; The following module is no-good because it doesn't fit all color schemes:
;; (require 'highlight-current-line)
;; (setq highlight-current-line-globally t)


;;; SQF MODE:
(add-to-list 'load-path (expand-file-name "~/.emacs.d/sqf-mode"))
(require 'sqf-mode)
(add-to-list 'auto-mode-alist '("\\.sqf\\'" . sqf-mode))


;;; TRANSLUCENCY EFFECT (TOGGLE WITH CTRL+F11):
(set-frame-parameter (selected-frame) 'alpha '(88 . 62))
(add-to-list 'default-frame-alist '(alpha . (88 . 62)))
(defvar opaque-frames '())
(defun toggle-frame-opacity ()
  (interactive)
  (let ((opaque (member (selected-frame) opaque-frames)))
    (if (not opaque)
	(progn
	  (add-to-list 'opaque-frames (selected-frame))
	  (set-frame-parameter (selected-frame) 'alpha '(100 . 100)))
      (progn
	(setf opaque-frames (delete (selected-frame) opaque-frames))
	(set-frame-parameter (selected-frame) 'alpha '(88 . 62))))))
(global-set-key [(control f11)] 'toggle-frame-opacity)


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

;;; ELISP FILTER:
(defun filter (condp lst)
  (delq nil (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

;;; SET FONT FACE (AFTER LOADING THEMES!):
(defun available-font-p (f)
  (find-font (font-spec :name f)))
(defun select-random-font ()
  (let ((fonts
	 (filter 'available-font-p
		 '("Anonymous Pro"
		   "Artesian"
		   "CentSchbook Mono BT"
		   "Consolas"
		   "Courier New"
		   "DejaVu Sans Mono"
		   "Envy Code R"
		   "Inconsolata"
		   "Liberation Mono"
		   "Lucida Console"
		   "Source Code Pro"
		   "Ti92Pluspc"))))
    (elt fonts (random (length fonts)))))
(defun select-random-variable-font ()
  (let ((fonts
	 (filter 'available-font-p
		 '("Arial"
		   "Calibri"
		   "Cambria"
		   "Comic Sans MS"
		   "Garamond"
		   "Georgia"
		   "Verdana"))))
    (elt fonts (random (length fonts)))))
(defun initialize-main-font-face ()
  (let ((font-size (elt '("9" "11" "13" "17.5") (random 4)))
	(mode-line-size (elt '("11" "13") (random 2)))
	(mode-line-font (select-random-font)))
    (set-face-attribute 'default nil
			:font (format "%s-%s"
				      (select-random-font)
				      font-size))
    (set-face-attribute 'variable-pitch nil
			:font (format "%s-%s"
				      (select-random-variable-font)
				      font-size))
    (set-face-attribute 'mode-line nil
			:font (format "%s-%s" mode-line-font mode-line-size))
    (set-face-attribute 'mode-line-inactive nil
			:font (format "%s-%s:slant=italic"
				      mode-line-font
				      mode-line-size))))

;;; SETUP CONSOLE LINE NUMBERS (AFTER LOADING THEMES!):
(defun initialize-linum-mode (global?)
  (require 'linum)
  (eval-after-load "linum"
    '(progn
       (if global? (global-linum-mode t)) ;;
       (set-face-attribute 'linum nil :font "Artesian:slant=italic")
       (set-face-attribute 'linum nil :height 62)
       (if (not global?) 
;; The following lines implement linum-mode by whitelist instead of global:
	   (progn
	     (defun linum-hook nil
	       (linum-mode 1)
	       (eval-after-load "linum"
		 '(set-face-attribute 'linum nil :height 62)))
	     (let ((linum-mode-whitelist '(inferior-python-mode-hook
					   slime-repl-mode-hook
					   text-mode-hook
					   csv-mode-hook
					   emacs-lisp-mode-hook)))
	       (mapcar (lambda (mode-hook) (add-hook mode-hook 'linum-hook))
		       linum-mode-whitelist)))))))

;;; PREPARE SPEEDBAR FONT/FORMATTING (AFTER LOADING THEMES!):
(defun initialize-speedbar ()
    (make-face 'speedbar-face)
    (set-face-font 'speedbar-face "Consolas-10")
    (setq speedbar-mode-hook '(lambda ()
				(buffer-face-set 'speedbar-face)
				(linum-mode -1))))

;;; RANDOM COLOR THEME INITIALIZATION FOLLOWED BY FONT SELECTION:
(defun initialize-random-color-theme ()
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
			    (color-theme-late-night)
			    (color-theme-robin-hood)
			    (color-theme-marquardt)
			    (color-theme-montz)
			    (color-theme-robin-hood)
			    (color-theme-word-perfect)
			    (load-moe t)
			    (load-moe nil)
			    (load-theme 'avk-darkblue-white t)
			    (load-theme 'avk-darkblue-yellow t)
			    (load-theme 'avk-daylight t)
			    (load-theme 'blackboard t)
			    (load-theme 'boron t)
			    (load-theme 'django t)
			    (load-theme 'dracula t)
			    (load-theme 'green-phosphor t)
			    (load-theme 'lavender t)
			    (progn
			      (load-theme 'purple-haze t)
			      (add-to-list 'default-frame-alist
					   '(width . 90)))
			    (load-theme 'soft-stone t)
			    (load-theme 'solarized-dark t)
			    (load-theme 'solarized-light t)
			    (load-theme 'subatomic t)
			    (load-theme 'subtle-blue t)
			    (load-theme 'suscolors t)
			    (load-theme 'sunny-day t)
			    (load-theme 'zenburn t)
			    (load-theme 'ubuntu t))))
       (eval (elt theme-strings (random (length theme-strings))))))
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (initialize-random-color-theme)
     (initialize-main-font-face)
     (initialize-linum-mode t)
     (initialize-speedbar)))

;;; CROSS-PLATFORM LINE ENDING COMPATIBILITY:
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

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

;;; NON-USER-EDITABLE!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," "	")))
 '(custom-safe-themes
   (quote
    ("b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" "72c7c8b431179cbcfcea4193234be6a0e6916d04c44405fc87905ae16bed422a" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" "aaf783d4bfae32af3e87102c456fba8a85b79f6e586f9911795ea79055dee3bf" "47ac4658d9e085ace37e7d967ea1c7d5f3dfeb2f720e5dec420034118ba84e17" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "38dba83122d982aae1e9bed53cc268e2be9820bccc9087ef4418cad7bb9ef61b" "61811a0ba7efd10dce51edd0f71183b512309a95cb2860449c437b4a5f8a321b" "552bde9766250587b2fd564ffdf3fad444ad74915ca5751fcb269bab840675c3" "726dd9a188747664fbbff1cd9ab3c29a3f690a7b861f6e6a1c64462b64b306de" "b825687675ea2644d1c017f246077cdd725d4326a1c11d84871308573d019f67" "f641bdb1b534a06baa5e05ffdb5039fb265fde2764fbfd9a90b0d23b75f3936b" "3d5307e5d6eb221ce17b0c952aa4cf65dbb3fa4a360e12a71e03aab78e0176c5" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
