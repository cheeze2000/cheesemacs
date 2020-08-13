;; Created with ThemeCreator, https://github.com/mswift42/themecreator
;; Edited by cheeze2000

(deftheme pastel)
(let ((class '((class color) (min-colors 89)))
      (fg1 "#eeeeee")
      (fg2 "#c6c6c6")
      (fg3 "#9e9e9e")
      (fg4 "#767676")
      (bg1 "#080808")
      (bg2 "#1c1c1c")
      (bg3 "#303030")
      (bg4 "#444444")
      (bg5 "#585858")
      (bg6 "#6c6c6c")
      (blue "#a8a8fc")
      (cyan "#a8fcfc")
      (green "#a8fca8")
      (purple "#fca8fc")
      (red "#fca8a8")
      (white "#fcfcfc")
      (yellow "#fcfca8"))
(custom-theme-set-faces
'pastel
  `(default ((,class (:background ,bg2 :foreground ,white))))
  `(font-lock-builtin-face ((,class (:foreground ,purple))))
  `(font-lock-comment-face ((,class (:foreground ,bg6))))
  `(font-lock-constant-face ((,class (:foreground ,red))))
  `(font-lock-doc-face ((,class (:foreground ,bg6))))
  `(font-lock-function-name-face ((,class (:foreground ,purple))))
  `(font-lock-keyword-face ((,class (:foreground ,blue))))
  `(font-lock-string-face ((,class (:foreground ,green))))
  `(font-lock-type-face ((,class (:foreground ,yellow))))
  `(font-lock-variable-name-face ((,class (:foreground ,red))))
  `(font-lock-warning-face ((,class (:foreground ,red))))
  `(highlight ((,class (:background ,bg3))))
  `(isearch ((,class (:foreground ,red :background ,bg3 :underline nil))))
  `(query-replace ((,class (:foreground ,red :background ,bg3 :underline nil))))
  `(lazy-highlight ((,class (:foreground ,red :underline t))))
  `(region ((,class (:background ,bg4))))
  `(trailing-whitespace ((,class (:foreground ,red :underline t))))
  `(mode-line ((,class (:foreground ,red :background ,bg3))))
  `(mode-line-inactive ((,class (:foreground ,bg5 :background ,bg3))))
  `(vertical-border ((,class (:foreground ,bg3 :background ,bg2))))
  `(minibuffer-prompt ((,class (:foreground ,red))))
  `(cursor ((,class (:background ,white))))
  `(line-number ((,class (:foreground ,bg4 :background ,bg3))))
  `(line-number-current-line ((,class (:foreground ,white :background ,bg2))))
  `(ivy-current-match ((,class (:background nil :underline t))))
  `(ivy-minibuffer-match-face-1 ((,class (:background ,bg3))))
  `(ivy-minibuffer-match-face-2 ((,class (:background ,bg3))))
  `(ivy-minibuffer-match-face-3 ((,class (:background ,bg3))))
  `(ivy-minibuffer-match-face-4 ((,class (:background ,bg3))))))

(when load-file-name
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'pastel)
