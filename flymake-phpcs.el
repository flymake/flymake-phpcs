;;; flymake-phpcs.el --- making flymake work with PHP CodeSniffer

;; Copyright 2013, 2014 Akiha Senda

;; Author: Akiha Senda <senda.akiha@gmail.com>
;; URL: https://github.com/senda-akiha/flymake-phpcs/
;; Created: 28 Novenver 2013
;; Version: 20131128.1109
;; Keywords: flymake, phpcs, php
;; Package-Requires: ((flymake-easy "0.9"))

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; To use PHP CodeSniffer with Emacs, you will need PHP CodeSniffer installed
;; and available on your path.  You should be able to do

;; $ phpcs

;; and, you'll also need to install flymake-easy.

;;; Usage

;; Add to your Emacs config:

;; (require 'flymake-phpcs)
;; (add-hook 'php-mode-hook 'flymake-phpcs-load)

;; How to customize the Coding Standard:

;; (custom-set-variables
;;  '(flymake-phpcs-standard "PSR2"))

;; or

;; (custom-set-variables
;;  '(flymake-phpcs-standard "/path/to/MyStandard"))

;; making sure that flymake-phpcs.el is on your load-path.  If not,
;; also add to your config:

;; (add-to-list 'load-path "~/.emacs.d/path/to/flymake-phpcs.el")

;;; Debugging

;; If phpcs isn't working for any reason, execute

;; M-x set-variable flymake-log-level <RET> 3

;; and you will see what is going wrong listed in the *Messages*
;; buffer.

;;; Changelog

;; 20131128.1109 -- Release first.

;;; Code:

(require 'flymake-easy)

(defconst flymake-phpcs-err-line-patterns
  '(("\"\\(.*\\)\",\\([[:digit:]]+\\),\\([[:digit:]]+\\),.*,\"\\(.*\\)\".*\r?\n"
     1 2 3 4)))

(defcustom flymake-phpcs-standard "PEAR"
  "Setting the Coding Standard for PHP CodeSniffer."
  :type 'string
  :group 'flymake-phpcs)

(defcustom flymake-phpcs-location 'inplace
  "Where to create the temporary copy: one of 'tempdir or 'inplace (default)."
  :type `(choice
          (const :tag "In place" inplace)
          (const :tag "Temporary location" tempdir))
  :group 'flymake-phpcs)

(defun flymake-phpcs-command (filename)
  "Construct a command that flymake can use to check PHP source."
  (list "phpcs" "--report=csv"
        (concat "--standard="
                (if (string-match "/" flymake-phpcs-standard)
                    (expand-file-name flymake-phpcs-standard)
                  flymake-phpcs-standard))
        filename))

;;;###autoload
(defun flymake-phpcs-load ()
  "Configure flymake mode to check the current buffer's PHP syntax."
  (interactive)
  (flymake-easy-load 'flymake-phpcs-command
                     flymake-phpcs-err-line-patterns
                     flymake-phpcs-location
                     "php"))

(provide 'flymake-phpcs)

;;; flymake-phpcs.el ends here
