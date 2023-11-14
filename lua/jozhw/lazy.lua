-- lazy requires leader keys to be mapped before plugins are required
--
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","
--
-- alternative solution to the above is to require in the root init.lua
-- the core with all of the remaps so that it loads first and then lazy
-- thus I can have all of the remaps together in one file for
-- organizational purposes

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    { { import = "jozhw.plugins" }, { import = "jozhw.plugins.lsp" } },
    {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
    }
)
