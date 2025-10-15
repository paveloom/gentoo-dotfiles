(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-14"))

(cua-mode)

(setopt treesit-font-lock-level 4)

(setopt project-mode-line t)

(setopt eglot-autoshutdown t)

;; The desktop.el package sets the `desktop-dirname' variable
;; itself, but it picks the default value from the first element of
;; the `desktop-path' list, which we make sure to prepare
(setq desktop-dirname (file-name-concat user-emacs-directory "desktops"))
(make-directory desktop-dirname t)
(setopt desktop-path (list desktop-dirname))
(desktop-save-mode 1)

(setopt server-name "server")
(server-start)
