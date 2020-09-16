;;; init.el --- Init file

;;; Commentary:
;;; Code:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun find-init-file ()
  (interactive)
  (find-file
    (concat user-emacs-directory "init.el")))

(defun find-theme-file ()
  (interactive)
  (find-file
    (concat user-emacs-directory "delicade-theme.el")))

(defun newline-and-indent-improved ()
  (interactive)
  (let ((col (save-excursion
               (back-to-indentation)
               (current-column))))
    (delete-horizontal-space)
    (newline)
    (indent-to-column col)))

(electric-indent-mode -1)
(global-display-line-numbers-mode)
(load-theme 'delicade t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "DejaVu Sans Mono 15" nil t)
(toggle-frame-fullscreen)
(tool-bar-mode -1)

(setq-default auto-save-default nil)
(setq-default create-lockfiles nil)
(setq-default confirm-kill-emacs #'y-or-n-p)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default make-backup-files nil)
(setq-default mode-line-format
  (list " " mode-line-modified "   %b  Ln %l, Col %c  " mode-line-modes))
(setq-default ring-bell-function 'ignore)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 2)

(straight-use-package 'use-package)
(setq-default straight-use-package-by-default t)
(use-package dhall-mode
  :custom
  (dhall-use-header-line nil))
(use-package elcord
  :config
  (elcord-mode)
  :custom
  (elcord-mode-icon-alist
    '((c++-mode . "cpp")
      (dhall-mode . "dhall")
      (emacs-lisp-mode . "emacs")
      (fundamental-mode . "emacs")
      (gitignore-mode . "git")
      (java-mode . "java")
      (js-mode . "js")
      (lisp-interaction-mode . "emacs")
      (magit-status-mode . "git")
      (purescript-mode . "purescript")))
  (elcord-mode-text-alist
    '((c++-mode . "C++")
      (dhall-mode . "Dhall")
      (emacs-lisp-mode . "Emacs Lisp")
      (gitignore-mode . "Git")
      (java-mode . "Java")
      (js-mode . "JavaScript")
      (lisp-interaction-mode . "Emacs Lisp")
      (magit-status-mode . "Git")
      (purescript-mode . "PureScript")))
  (elcord-client-id "755743906079178832")
  (elcord-use-major-mode-as-main-icon t)
  (elcord--editor-name "Emacs 27.1")
  (elcord--editor-icon "emacs-icon"))
(use-package gitignore-mode)
(use-package ivy
  :config
  (ivy-mode))
(use-package magit)
(use-package purescript-mode)
(use-package treemacs
  :demand t
  :bind
  (("C-o" . ace-window)
   ("C-x d" . treemacs-select-window))
  :config
  (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-ace)
  (treemacs)
  (treemacs--set-width 30))

(bind-key "M-i" 'find-init-file)
(bind-key "M-p" 'find-theme-file)
(bind-key "RET" 'newline-and-indent-improved)

(provide 'init)

;;; init.el ends here
