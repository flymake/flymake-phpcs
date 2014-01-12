flymake-phpcs.el
================

PHP CodeSniffer for Emacs with flymake-mode.

To use [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) with Emacs, you will need PHP CodeSniffer installed.

You should be able to run

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
     '(flymake-phpcs-standard "PSR2"))

or

    (custom-set-variables
     '(flymake-phpcs-standard "/path/to/MyStandard"))

phpcs command location
----------------------

By default, the location of the `phpcs` command is searched.

    (custom-set-variables
     '(flymake-phpcs-command "/path/to/phpcs"))

Where to create temporary copy
------------------------------

one of 'tempdir or 'inplace (default).

    (custom-set-variables
     '(flymake-phpcs-location 'tempdir))
