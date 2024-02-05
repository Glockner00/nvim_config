-- Disable netrw and netrwPlugin as we won't be using them
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set up lazy.nvim plugin with a lazy load mechanism
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is not already installed
if not vim.loop.fs_stat(lazypath) then
  -- Clone lazy.nvim from the GitHub repository
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Add lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Load custom configuration files
require("core.options")       -- Basic editor options
require("core.keymaps")       -- Custom key mappings
require("core.plugins")       -- Load plugins
require("core.plugin_config") -- Configure plugin settings

