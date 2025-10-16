(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-14"))

(setopt indent-tabs-mode nil
        tab-width 4)

(setopt whitespace-style '(face tabs tab-mark trailing missing-newline-at-eof
                                space-after-tab space-before-tab)
        ;; The numbers are UTF-16 code units (which are hexademical) converted to decimal
        whitespace-display-mappings '((space-mark 32 [183])     ; `·` (regular space)
                                      (space-mark 160 [164])    ; `¤` (wide space)
                                      (newline-mark 10 [36 10]) ; `$`
                                      (tab-mark 9 [8594 9])))   ; `→`
(global-whitespace-mode 1)
(set-face-attribute 'whitespace-tab nil :height 0.8 :background nil)

(cua-mode 1)

(setopt treesit-font-lock-level 4)

(setopt project-mode-line t)

(setopt eglot-autoshutdown t
        eglot-extend-to-xref t)

;; The desktop.el package sets the `desktop-dirname' variable
;; itself, but it picks the default value from the first element of
;; the `desktop-path' list, which we make sure to prepare
(setq desktop-dirname (file-name-concat user-emacs-directory "desktops"))
(make-directory desktop-dirname t)
(setopt desktop-path (list desktop-dirname))
(desktop-save-mode 1)

(setopt server-name "server")
(server-start)
