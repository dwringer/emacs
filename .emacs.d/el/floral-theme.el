(deftheme floral 
  "Based on a particular image of some flowers")

(custom-theme-set-faces
 `floral
 `(default ((t (:background "#0C1308" :foreground "#588A4F" ))))
 `(bold ((t (:bold t))))
 `(bold-italic ((t (:bold t))))
 `(border-glyph ((t (nil))))
 `(buffers-tab ((t (:background "#0C1308" :foreground "#588A4F"))))
 `(font-lock-builtin-face ((t (:foreground "#78796A"))))
 `(font-lock-comment-face ((t (:italic t :foreground "#2B3717"))))
 `(font-lock-constant-face ((t (:foreground "#B0770A"))))
 `(font-lock-doc-string-face ((t (:foreground "#B0770A"))))
 `(font-lock-function-name-face ((t (:foreground "#975798"))))
 `(font-lock-keyword-face ((t (:foreground "#593F4C"))))
 `(font-lock-preprocessor-face ((t (:foreground "#596362"))))
 `(font-lock-reference-face ((t (:foreground "#48402C"))))

 `(font-lock-regexp-grouping-backslash ((t (:foreground "#6F7437"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#B0770A"))))

 `(font-lock-string-face ((t (:foreground "#61CE3C"))))
 `(font-lock-type-face ((t (:foreground "#596362"))))
 `(font-lock-variable-name-face ((t (:foreground "#6F7437"))))
 `(font-lock-warning-face ((t (:bold t :foreground "#975798"))))
 `(gui-element ((t (:background "#556254" :foreground "#0C1308"))))
 `(region ((t (:background "#593F4C" :foreground "#975798"))))
 `(mode-line ((t (:background "#625D22" :foreground "#0C1308"))))
 `(highlight ((t (:background "#314A16"))))
 `(highline-face ((t (:background "#596362"))))
 `(italic ((t (nil))))
 `(left-margin ((t (nil))))
 `(text-cursor ((t (:background "#B0770A" :foreground "#0C1308"))))
 `(toolbar ((t (nil))))
 `(underline ((nil (:underline nil))))
 `(zmacs-region ((t (:background "#5B7D65" :foreground "#593F4C")))))

(provide-theme 'floral)
