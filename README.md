# Personal Neovim Configuration

Note: configured for macos, has not been tested for linux distros.

Signficant amount of the configurations are taken:

- @theprimeagen
- @josean-dev
- @benbrastmckie (vimtex)

# Installing Neovim

Please see the neovim documentation [here](https://github.com/neovim/neovim/blob/master/INSTALL.md).

For macos users using brew, use:

```
brew install neovim

```

## Dependencies

### vimtex (latex)

In order to run the latex commands, make sure to have the following installed:

- latex (mactex, etc.)
  - installation for macos
    - `brew install --cask mactex`
  - note: mactex should have latexmk preinstalled
- skim (for pdf viewing)
  - installation for macos
    - `brew install -cask skim`
- latexmk (compling latex files)

In order to use the templating key commands, you must have the templates downloaded and stored in the main file directory.

To install make sure you are in your systems home directory with the command line open and type the following commands:

```
mkdir latex-templates
cd latex-templates
git init
git pull https://github.com/jozhw/latex-templates.git

```

## Issues

### treesitter error

If the following error is similar to this:

```
treesitter/highlighter: Error executing lua: ...im/0.6.0/share/nvim/runtime/lua/vim/treesitter/query.lua:161:
```

It could be that treesitter may be out of date. If so, run the following:

```
:TSUpdate
```
