# Personal Neovim Configuration

_Note: I use MacOs for development_

Signficant amount of the configurations are taken from @theprimeagen and @josean-dev.

## Issues

### treesitter error

```
treesitter/highlighter: Error executing lua: ...im/0.6.0/share/nvim/runtime/lua/vim/treesitter/query.lua:161:
```

It could be that treesitter may be out of date. If so, run the following:

```
:TSUpdate
```
