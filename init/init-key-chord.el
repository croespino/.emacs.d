(require 'key-chord)
(key-chord-mode 1)
;; Key chords to use: hh, qq, aa, uu, yy, vv, js
(key-chord-define-global "mx" 'smex)
(key-chord-define-global "fj" 'ido-switch-buffer)
(key-chord-define-global "xk" 'ido-kill-buffer)
(key-chord-define-global "xj" 'dired-jump)
(key-chord-define-global "xh" 'mark-whole-buffer)
(key-chord-define-global "cm" 'goto-match-paren)
(key-chord-define-global "jj" 'er/expand-region)
(key-chord-define-global "kd" 'ace-jump-char-mode)
(key-chord-define-global "kc" 'ace-jump-char-mode)
(key-chord-define-global "kk" 'ace-jump-line-mode)
(key-chord-define-global ",." 'eshell)
(key-chord-define-global "ms" 'magit-status)
(key-chord-define-global "ml" 'magit-log)
(key-chord-define-global "qj" 'ispell-word)
(key-chord-define-global "xc" 'exchange-point-and-mark)
(key-chord-define-global "fs" 'point-to-register)
(key-chord-define-global "jl" 'jump-to-register)
(key-chord-define-global "jk" 'ace-jump-mode-pop-mark)
(key-chord-define-global "xx" 'delete-other-windows)
(key-chord-define-global "ww" 'delete-window)
(key-chord-define-global "ii" 'evil-force-normal-state)
(add-hook 'eshell-mode-hook
          '(lambda () (key-chord-define eshell-mode-map ",." 'exit-eshell)))
(key-chord-define dired-mode-map "oe" 'open-file-with-external-program)
(key-chord-define dired-mode-map "ep" 'export-latex-to-pdf)
(require 'message)
(key-chord-define message-mode-map "jq" 'ispell-message)

(provide 'init-key-chord)