return {
   {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
   },

   {
      "rhysd/accelerated-jk",
      opt = true,
      config = function ()
         require('rhysd/accelerated-jk').setup()
      end
   },

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

   -- {
   --    "xiyaowong/accelerated-jk.nvim",
   --    opt = true,
   --    setup = function ()
   --       require('xiyaowong/accelerated-jk.nvim').setup()
   --    end
   -- },

   -- {
   --    "user or orgname/reponame",
   --    --further packer options
   -- }
}