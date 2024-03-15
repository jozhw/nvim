-- import mason plugin safely
-- import mason
local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

local mason_tool_installer = require("mason-tool-installer")

-- enable mason
mason.setup({
    ensure_isntalled = {
        "tailwindcss-language-server",
        "eslint-lsp",
        "python-lsp-server",
    },
    automatic_installation = true,
})

mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "clangd",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
})

mason_tool_installer.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
        "htmlbeautifier", -- html formatter
        "black",
        "isort",
        "clang-format",
        "codelldb",
    },
})
