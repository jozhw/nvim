-- key maps for template importing

local keymap = vim.keymap -- for conciseness

-- set keymaps to auto import a latex template
-- follow the following convention to avoid keymap conflicts
-- use <localleader>t<initals of the type of template lowercase>
-- for the above t means template to make the key mapping intutitive
-- in the case below je is the initials for JournalEntry.

keymap.set(
    "n",
    "<localleader>tje",
    "<cmd>read ~/latex-templates/journal-entry/JournalEntry.tex<CR>"
)

keymap.set(
    "n",
    "<localleader>tmn",
    "<cmd>read ~/latex-templates/message-notes/MessageNotes.tex<CR>"
)

keymap.set(
    "n",
    "<localleader>tba",
    "<cmd>read ~/latex-templates/book-analysis/BookAnalysis.tex<CR>"
)
local config = require("nvim-surround.config")

require("nvim-surround").buffer_setup({
    surrounds = {
        -- ["e"] = {
        --   add = function()
        --     local env = require("nvim-surround.config").get_input ("Environment: ")
        --     return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
        --   end,
        -- },
        ["Q"] = {
            add = { "``", "''" },
            find = "%b``.-''",
            delete = "^(``)().-('')()$",
        },
        ["q"] = {
            add = { "`", "'" },
            find = "`.-'",
            delete = "^(`)().-(')()$",
        },
        ["b"] = {
            add = { "\\textbf{", "}" },
            -- add = function()
            --   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
            --     return { { "\\mathbf{" }, { "}" } }
            --   end
            --   return { { "\\textbf{" }, { "}" } }
            -- end,
            find = "\\%a-bf%b{}",
            delete = "^(\\%a-bf{)().-(})()$",
        },
        ["i"] = {
            add = { "\\textit{", "}" },
            -- add = function()
            --   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
            --     return { { "\\mathit{" }, { "}" } }
            --   end
            --   return { { "\\textit{" }, { "}" } }
            -- end,
            find = "\\%a-it%b{}",
            delete = "^(\\%a-it{)().-(})()$",
        },
        ["s"] = {
            add = { "\\textsc{", "}" },
            find = "\\textsc%b{}",
            delete = "^(\\textsc{)().-(})()$",
        },
        ["t"] = {
            add = { "\\texttt{", "}" },
            -- add = function()
            --   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
            --     return { { "\\mathtt{" }, { "}" } }
            --   end
            --   return { { "\\texttt{" }, { "}" } }
            -- end,
            find = "\\%a-tt%b{}",
            delete = "^(\\%a-tt{)().-(})()$",
        },
        ["$"] = {
            add = { "$", "$" },
            -- find = "%b$.-$",
            -- delete = "^($)().-($)()$",
        },
    },
})

-- PdfAnnots
function PdfAnnots()
    local ok, pdf = pcall(
        vim.api.nvim_eval,
        "vimtex#context#get().handler.get_actions().entry.file"
    )
    if not ok then
        vim.notify("No file found")
        return
    end

    local cwd = vim.fn.getcwd()
    vim.fn.chdir(vim.b.vimtex.root)

    if vim.fn.isdirectory("Annotations") == 0 then
        vim.fn.mkdir("Annotations")
    end

    local md =
        vim.fn.printf("Annotations/%s.md", vim.fn.fnamemodify(pdf, ":t:r"))
    vim.fn.system(vim.fn.printf('pdfannots -o "%s" "%s"', md, pdf))
    vim.cmd.split(vim.fn.fnameescape(md))

    vim.fn.chdir(cwd)
end

-- -- LSP menu to preserve vimtex citation data
-- require('cmp').setup.buffer {
--   formatting = {
--     format = function(entry, vim_item)
--         vim_item.menu = ({
--           omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
--           buffer = "[Buffer]",
--           -- formatting for other sources
--           })[entry.source.name]
--         return vim_item
--       end,
--   },
--   sources = {
--     { name = 'omni' },
--     { name = 'buffer' },
--     -- other sources
--   },
-- }
