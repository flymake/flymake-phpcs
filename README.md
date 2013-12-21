flymake-phpcs.el
================

PHP CodeSniffer for Emacs with flymake-mode.

To use phpcs with Emacs, you will need Phpcs installed and available on your path.

You should be able to do

    $ phpcs

and, you'll also need to install [flymake-easy](https://github.com/purcell/flymake-easy).

Usage
=====

You'll need to add the directory containing `flymake-phpcs.el` to your `load-path`.

If not, also add to your config

    (add-to-list 'load-path "~/.emacs.d/path/to/flymake-phpcs.el")

Add to your Emacs config
------------------------

    (require 'flymake-phpcs)
    (add-hook 'php-mode-hook 'flymake-phpcs-load)

How to customize the Coding Standard
------------------------------------

    (custom-set-variables
     '(phpcs-coding-standard "PSR2"))
