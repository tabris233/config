return {
   {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
   },

   -- {
   --    "rhysd/accelerated-jk",
   --    opt = true,
   --    config = function ()
   --       require('rhysd/accelerated-jk').setup()
   --    end
   -- },

   -- 自动保存文件插件
   {
      "Pocco81/AutoSave.nvim",
      config = function()
         local autosave = require "autosave"

         autosave.setup {
            enabled = true,
            execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
            events = { "InsertLeave", "TextChanged" },
            conditions = {
               exists = true,
               filetype_is_not = {},
               modifiable = true,
            },
            clean_command_line_interval = 2500,
            on_off_commands = true,
            write_all_buffers = false,
         }
      end,
   },

   {
      "PHSix/faster.nvim",
      event = {"VimEnter *"},
      config = function()
         -- vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
         -- vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
         -- or 
         vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_gj)', {}) -- {noremap=false, silent=true})
         vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_gk)', {}) -- {noremap=false, silent=true})
         -- if you need map in visual mode
         vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', {noremap=false, silent=true})
         vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', {noremap=false, silent=true})
      end
   },

   -- {
   --   "xiyaowong/accelerated-jk.nvim",
   --    opt = true,
   --    config = function ()
   --       require('accelerated-jk').setup()
   --    end
   --  
   -- },

   {
      'glacambre/firenvim',
      run = function()
         vim.fn['firenvim#install'](0)
      end
   },


   -- {
   --    "user or orgname/reponame",
   --    --further packer options
   -- }
}
