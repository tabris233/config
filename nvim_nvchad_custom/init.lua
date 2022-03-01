-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it


-- vim.opt.listchars={space="_", tab=">~"}

vim.o.cursorcolumn = true
vim.o.cursorline = true

-- Stop sourcing filetype.vim
vim.g.did_load_filetypes = 1


print(vim.g.started_by_firenvim)
-- firenvim config
if vim.g.started_by_firenvim then
  print("firvnvim -- start")
  -- vim.cmd [[ set guifont=Monaco:h80 ]]
  -- vim.opt.guifont=Monaco:h18

  map("n", "<leader>font", ":set guifont=Monaco:h22<CR>")
  map("n", "<leader>fonf", ":set guifont=JetBrainsMono_Nerd_Font:h22<CR>")
end
