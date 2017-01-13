(deftheme solar-autumn 
  "Solarized autumn-inspired theme")

(custom-theme-set-faces
 `solar-autumn
 `(default ((t (:background "#CA976C" :foreground "#EEF1E8" ))))
 `(bold ((t (:bold t))))
 `(bold-italic ((t (:bold t))))
 `(border-glyph ((t (nil))))
 `(buffers-tab ((t (:background "#CA976C" :foreground "#EEF1E8"))))
 `(font-lock-builtin-face ((t (:foreground "#B1E0E8"))))
 `(font-lock-comment-face ((t (:italic t :foreground "#979378"))))
 `(font-lock-constant-face ((t (:foreground "#7E7858"))))
 `(font-lock-doc-string-face ((t (:foreground "#192732"))))
 `(font-lock-function-name-face ((t (:foreground "#192732"))))
 `(font-lock-keyword-face ((t (:foreground "#71582F"))))
 `(font-lock-preprocessor-face ((t (:foreground "#979378"))))
 `(font-lock-reference-face ((t (:foreground "#C5AD55"))))

 `(font-lock-regexp-grouping-backslash ((t (:foreground "#C5AD55"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#C5AD55"))))

 `(font-lock-string-face ((t (:foreground "#5D6019"))))
 `(font-lock-type-face ((t (:foreground "#C5AD55"))))
 `(font-lock-variable-name-face ((t (:foreground "#7E7858"))))
 `(font-lock-warning-face ((t (:bold t :foreground "#B1E0E8"))))
 `(gui-element ((t (:background "#71582F" :foreground "#CA976C"))))
 `(region ((t (:background "#71582F" :foreground "#EEF1E8"))))
 `(mode-line ((t (:background "#192732" :foreground "#CA976C"))))
 `(highlight ((t (:background "#192732"))))
 `(highline-face ((t (:background "#C5AD55"))))
 `(italic ((t (nil))))
 `(left-margin ((t (nil))))
 `(text-cursor ((t (:background "#B1E0E8" :foreground "#CA976C"))))
 `(toolbar ((t (nil))))
 `(underline ((nil (:underline nil))))
 `(zmacs-region ((t (:background "#EEF1E8" :foreground "#B1E0E8")))))

(provide-theme 'solar-autumn)

;;; solar-autumn-theme.el ends here.
