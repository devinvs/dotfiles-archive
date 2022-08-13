-------------- Init ----------------------
vim.cmd("syntax on")
vim.cmd("colorscheme material")

-------------- Plugins -------------------
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'        	            -- Package manager
    use 'neovim/nvim-lspconfig'                     	-- Config for nvim lsp
    use 'DevinVS/material.vim'          	            -- Material Theme
    use {'ms-jpq/coq_nvim', branch='coq'}	            -- Completion
    use {'ms-jpq/coq.artifacts', bracnh='artifacts'}	-- Completion
    use 'simrat39/rust-tools.nvim'      	            -- Rust
end)

-------------- PluginSetup ---------------
vim.g['coq_settings'] = { auto_start='shut-up' }    -- Start completion

local lsp = require "lspconfig"
local coq = require "coq"

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())          -- Rust
lsp.ccls.setup(coq.lsp_ensure_capabilities())                   -- C/C++
lsp.ccls.setup(coq.lsp_ensure_capabilities())                   -- C/C++
lsp.jedi_language_server.setup(coq.lsp_ensure_capabilities())   -- Python
lsp.eslint.setup(coq.lsp_ensure_capabilities())                 -- JS
lsp.gopls.setup(coq.lsp_ensure_capabilities())                  -- Go

-- Rust Tools Setup
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

-------------- Options -------------------
vim.opt.guicursor = ""                	-- Use terminal cursor
vim.opt.termguicolors = true		    -- use theme colors
vim.opt.backspace = "indent,eol,start"	-- backspace behavior
vim.opt.number = true			        -- show numbers
vim.opt.showcmd = true			        -- show command line
vim.opt.tabstop = 4	                    -- set tabs to 4 spaces
vim.opt.expandtab = true		        -- replace tabs with spaces
vim.opt.shiftwidth = 4			        -- how far to shift by
vim.opt.softtabstop = 4
vim.opt.textwidth = 80                  -- break after 80 characters
vim.opt.incsearch = true                -- search as you type
vim.opt.hlsearch = true                 -- highlight search results
vim.opt.foldenable = true               -- enable folding nested code
vim.opt.foldlevelstart = 10             -- fold after 10 nested layers
vim.opt.foldmethod = "indent"          -- fold by indenting

-------------- Keybinds ------------------
vim.keymap.set('n', 'j', 'gj')          -- Move through visual, not actual lines
vim.keymap.set('n', 'k', 'gk')          -- Move through visual, not acutal lines
