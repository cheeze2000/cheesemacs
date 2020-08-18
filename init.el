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
  "Open the init file in current buffer."
  (interactive)
  (find-file user-init-file))

(defun newline-and-indent-improved ()
  "Insert newline and keep the indentation of the previous line."
  (interactive)
  (let ((col (save-excursion
               (back-to-indentation)
               (current-column))))
  (delete-horizontal-space)
  (newline)
  (indent-to-column col)))

(electric-indent-mode -1)
(global-display-line-numbers-mode)
(load-theme 'pastel t)
(menu-bar-mode -1)
(set-display-table-slot
  standard-display-table
  'vertical-border
  (make-glyph-code ?┃))
(set-frame-font "Bitstream Vera Sans Mono 12" nil t)

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
(setq-default straight-use-package-by-default t)
(setq-default tab-width 2)

(straight-use-package 'use-package)
(use-package haskell-mode)
(use-package ivy
  :config
  (ivy-mode))
(use-package magit
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-display-buffer-function
    (lambda (buffer)
      (display-buffer buffer '(display-buffer-same-window)))))
(use-package org
  :demand t
  :bind
  (("C-c a" . org-agenda))
  :init
  (setq org-agenda-files '("~/org"))
  (setq org-agenda-tags-column 60)
  (setq org-tags-column 60)
  :config
  (org-agenda-list)
  (delete-other-windows))
(use-package treemacs
  :demand t
  :bind
  (("C-o" . ace-window)
   ("C-x d" . treemacs-select-window))
  :config
  (treemacs-define-RET-action 'file-node-closed #'treemacs-visit-node-ace)
  (treemacs-select-window)
  (treemacs--set-width 27)
  (treemacs-toggle-node))

(bind-key* "M-i" 'find-init-file)
(bind-key "RET" 'newline-and-indent-improved)
