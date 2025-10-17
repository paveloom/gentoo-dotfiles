(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-14"))

(setopt flyspell-delay 0)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(column-number-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setopt indent-tabs-mode nil
        tab-always-indent 'complete
        tab-width 4
        go-ts-mode-indent-offset tab-width)

(setopt whitespace-style '(face tabs tab-mark trailing missing-newline-at-eof
                                space-after-tab space-before-tab)
        ;; The numbers are UTF-16 code units (which are hexademical) converted to decimal
        whitespace-display-mappings '((space-mark 32 [183])     ; `·` (regular space)
                                      (space-mark 160 [164])    ; `¤` (wide space)
                                      (newline-mark 10 [36 10]) ; `$`
                                      (tab-mark 9 [8250 9])))   ; `›`
(global-whitespace-mode)
(set-face-attribute 'whitespace-tab nil :background 'unspecified)

(global-word-wrap-whitespace-mode)

(cua-mode)

(setopt treesit-font-lock-level 4)

(setopt project-mode-line t)

(setopt eldoc-idle-delay 0)

(setopt eglot-autoshutdown t
        eglot-extend-to-xref t)

;; Regular expressions identifying files whose buffers are to be
;; excluded from saving to the desktop file, in order:
;;
;; - "\`/[^/:]*:" (e.g., "/root@server:")
;; - "\`/usr/lib/go/" (Go's standard library)
(setopt desktop-files-not-to-save "\\(\\`/[^/:]*:\\|\\`/usr/lib/go/\\)")
(desktop-save-mode)

(setopt server-name "server")
(server-start)

(setopt custom-file (file-name-concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
