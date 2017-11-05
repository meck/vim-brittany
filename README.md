# vim-brittany

This is an adaption of [vim-stylishask](https://github.com/alx741/vim-stylishask).

Vim-brittany integrates with [brittany](http://https://github.com/lspitzner/brittany) so every time
you save a Haskell source file it gets automatically prettified.

Simply using `:%!brittany` replaces your whole source file with an error message
from **brittany** when you happen to have a syntax error in your code, this
plugin manages that annoyance.

*Note:* If you prefer *stylish-haskell* use
[vim-stylishask](https://github.com/alx741/vim-stylishask) instead.

## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

By default, *vim-brittany* will format your code automatically when saving a
Haskell source file, but you can use the `:Brittany` command at any time to
format the current file.

Use `:BrittanyEnable`, `:BrittanyDisable`, `:BrittanyToggle` to enable, disable, or
toggle running `brittany` on save.


## Configuration

Trigger *brittany* when saving (default = 1):

```vim
g:brittany_on_save = 1
```

*Brittany* configuration file to use (default = "" == Use default ~/.brittany/config.yaml):

```vim
g:stylishask_config_file = "/path/to/.stylish-haskell.yaml"
```
