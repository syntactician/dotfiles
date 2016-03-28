(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'evil-commentary)
(evil-commentary-mode)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cl" 'org-agenda)
(setq org-log-done t)


(menu-bar-mode -1)

(setq tex-dvi-view-command "xdvi")
