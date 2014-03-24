(add-to-list 'load-path "~/.emacs.d/extensions/php")
(require 'php-mode)

(autoload 'php-mode "php-mode"
  "Major mode for editing php code." t)

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(provide 'init-php-mode)
