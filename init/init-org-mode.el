(require 'org)

(require 'org-agenda)

(setq viper-mode nil)

(require 'viper)

(setq org-src-fontify-natively t
      org-log-repeat nil)

(setq org-level-faces '(org-level-1
                        org-level-2
                        org-level-5
                        org-level-4
                        org-level-3
                        org-level-6
                        org-level-7
                        org-level-8))

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(add-hook 'org-mode-hook (lambda ()
                           (org-indent-mode 1)))

(setq org-agenda-files '("~/Dropbox/Org"))

(defun archive-all-done ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(defun set-runtime (selected-runtime)
  (interactive "sEnter runtime (Quick: A, Medium: B, Long: C, Overlong: D): ")
  (org-beginning-of-line)
  (forward-word)
  (backward-word)
  (insert " ")
  (backward-char)
  (insert (format "[#%s" selected-runtime))
  (backward-char)
  (capitalize-word 1)
  (insert "]")
  (org-beginning-of-line))

(defun set-priority (selected-priority)
  (interactive "nEnter priority (Blocker: 1, Critical: 2, Major: 3, Minor: 4, Trivial: 5): ")
  (if (< selected-priority 1) (error "Enter an integer number between 0 and 6")
    (if (> selected-priority 5) (error "Enter an integer number between 0 and 6")
      (search-forward "]")
      (forward-char)
      (insert (format "[#%d] " selected-priority))
      (org-beginning-of-line))))

(add-hook 'kill-emacs-hook (lambda ()
                             (interactive)
                             (shell-command "cd ~/Dropbox/Org ; git add -A ; git commit -m \"Emacs kill push\" ; git push -u origin master" nil nil)))

(defun push-org-notes ()
  (interactive)
  (shell-command "cd ~/Dropbox/Org ; git add -A ; git commit -m \"Emacs manually puched notes\" ; git push -u origin master" nil nil))

(define-key org-agenda-mode-map (kbd "k") 'org-agenda-previous-line)

(define-key org-agenda-mode-map (kbd "j") 'org-agenda-next-line)

(define-key org-agenda-mode-map (kbd "m") 'org-agenda-switch-to)

(define-key org-agenda-mode-map (kbd "s") 'ace-jump-char-mode)

(define-key org-mode-map (kbd ",") nil)

(define-key org-agenda-mode-map (kbd ",") nil)

;; (add-hook 'emacs-startup-hook (lambda ()
;;                                 (org-agenda-list)
;;                                 (delete-other-windows)))

(provide 'init-org-mode)
