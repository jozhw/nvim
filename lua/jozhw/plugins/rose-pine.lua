return {
    { -- main color scheme
        "rose-pine/neovim",
        lazy = false, --  make sure to load during startup
        priority = 1000, -- make sure to load before all plugins
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    },
}
