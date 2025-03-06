;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-operandi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list 'default-frame-alist '(fullscreen . fullscreen))

(setq doom-variable-pitch-font (font-spec :family "Linux Biolinum O"))
(setq doom-font (font-spec :family "Aporetic Sans Mono" :size 18))
(add-hook 'text-mode-hook (lambda ()
                            (setq-local line-spacing 0.1)))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(after! writeroom-mode
  (setq +zen-text-scale 1.25))

;; (custom-set-faces!
;;   '(mode-line :height 90 :inherit 'variable-pitch)
;;   '(mode-line-inactive :height 80 :inherit 'variable-pitch))

;; (after! all-the-icons
;;   (setq all-the-icons-scale-factor 1.1))

(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'truncate-with-project))

(with-eval-after-load "quail"
  (push
   (cons "dvorak"
         (concat
          "                              "
          "`~1!2@3#4$5%6^7&8*9(0)[{]}    "   ; numbers
          "  '\",<.>pPyYfFgGcCrRlL/?=+\\|  " ; qwerty
          "  aAoOeEuUiIdDhHtTnNsS-_      "   ; asdf
          "  ;:qQjJkKxXbBmMwWvVzZ        "   ; zxcv
          "                              "))
   quail-keyboard-layout-alist)

  (quail-set-keyboard-layout "dvorak"))

(good-scroll-mode 1)
(display-time-mode 1)


(setq telega-use-images t)
(define-key global-map (kbd "C-c t") telega-prefix-map)
(setq whitespace-style 'nil)

(add-hook 'org-mode-hook #'olivetti-mode)
(add-hook 'org-mode-hook #'mixed-pitch-mode)

;; Resize Org headings
(dolist (face '((org-level-1 . 1.35)
                (org-level-2 . 1.3)
                (org-level-3 . 1.2)
                (org-level-4 . 1.1)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Futura Md BT" :weight 'bold :height (cdr face)))

;; Make the document title a bit bigger
(set-face-attribute 'org-document-title nil :font "Futura Md BT" :weight
                    'bold :height 1.8)

(add-to-list 'Info-directory-list "/usr/share/info/emacs/")
