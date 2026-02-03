------------------------------------------------------------------------------
-- Basic options configurations
------------------------------------------------------------------------------
vim.g.mapleader = " "           -- Space as leader
vim.g.maplocalleader = " "      -- Space for local leader too 

------------------------------------------------------------------------------
-- Basic options configurations
------------------------------------------------------------------------------

-- Line numbers
vim.opt.number = true		    	-- Show line numbers 
vim.opt.relativenumber = true		-- Relative to cursor position

-- Identation 
vim.opt.tabstop = 4			    -- Tab displays as 4 spaces
vim.opt.shiftwidth = 4 			-- Indent by 4 spaces
vim.opt.expandtab = true 		-- Tab key inserts spaces, not /t 

-- Search
vim.opt.ignorecase = true       -- Case insensitive search
vim.opt.smartcase = true        -- Unless you type a Capital

-- Visual 
vim.opt.termguicolors = true    -- True color support
vim.opt.cursorline = true       -- Highlight current line
vim.opt.scrolloff = 8           -- Keep 8 lines visible above/below the cursor

-- System Integration
vim.opt.clipboard = "unnamedplus"       -- Use the system clipboard
vim.opt.mouse = "a"                     -- Enable mouse


------------------------------------------------------------------------------
-- Keymaps
------------------------------------------------------------------------------
local map = vim.keymap.set      -- Shorthand

-- Clear search highlight with Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Quit
-- map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Window navigation with Ctrl+hjkl 
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window"})
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window"})
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window"})
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window"})

-- File explorer toggle 
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Side Explorer" })

------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
------------------------------------------------------------------------------
require("config.lazy")
