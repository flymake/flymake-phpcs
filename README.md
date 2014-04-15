# Note

##### I recommend that you use the [flycheck](https://github.com/flycheck/flycheck).

##### Because, you can run the checker more than one. Of course, including `phpcs`.

# flymake-phpcs.el

PHP CodeSniffer for Emacs with flymake-mode.

To use [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) with Emacs, you will need PHP CodeSniffer installed.

You should be able to run

```sh
$ phpcs
```

and, you'll also need to install [flymake-easy](https://github.com/purcell/flymake-easy).

# Usage

You'll need to add the directory containing `flymake-phpcs.el` to your `load-path`.

If not, also add to your config

```lisp
(add-to-list 'load-path "~/.emacs.d/path/to/flymake-phpcs.el")
```

## Add to your Emacs config

```lisp
(require 'flymake-phpcs)
(add-hook 'php-mode-hook 'flymake-phpcs-load)
```

## How to customize the Coding Standard

```lisp
(custom-set-variables
 '(flymake-phpcs-standard "PSR2"))
```

or

```lisp
(custom-set-variables
 '(flymake-phpcs-standard "/path/to/MyStandard"))
```

## phpcs command location

By default, the location of the `phpcs` command is searched.

```lisp
(custom-set-variables
 '(flymake-phpcs-command "/path/to/phpcs"))
```

## Where to create temporary copy

one of 'tempdir or 'inplace (default).

```lisp
(custom-set-variables
 '(flymake-phpcs-location 'tempdir))
```
