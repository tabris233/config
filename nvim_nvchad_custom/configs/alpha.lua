local present, alpha = pcall(require, "alpha")

if not present then
   return
end

local ascii = {
   "                                                     ",
   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
   "                                                     ",
}

local header = {
   type = "text",
   val = ascii,
   opts = {
      position = "center",
      hl = "AlphaHeader",
   },
}

local function button(sc, txt, keybind)
   local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

   local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "AlphaButtons",
   }

   if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
   end

   return {
      type = "button",
      val = txt,
      on_press = function()
         local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
         vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
   }
end

local buttons = {
   type = "group",
   val = {
      button("e",       "  > 新建文件" ,  ":ene <BAR> startinsert <CR>"),
      button("SPC f f", "  > 文件搜索",   ":Telescope find_files<CR>" ),
      button("SPC f o", "  > 最近文件",   ":Telescope oldfiles<CR>" ),
      button("SPC f w", "  > 关键词搜索", ":Telescope live_grep<CR>" ),
      button("SPC m",   "  > Bookmarks" , ":Telescope marks<CR>" ),
      button("SPC t h", "  > 主题",       ":Telescope themes<CR>"),
      button("SPC e s", "  > 设置",       ":e $MYVIMRC | :cd %:p:h <CR>"),
      -- button("SPC f l", "  > 最后会话" ,    ":SessionLoad<CR>" ),
      button("q",       "  > 推出 NVIM", ":qa<CR>"),
   },
   opts = {
      spacing = 1,
   },
}

local section = {
   header = header,
   buttons = buttons,
}

alpha.setup {
   layout = {
      { type = "padding", val = 5 },
      section.header,
      { type = "padding", val = 2 },
      section.buttons,
   },
   opts = {},
}
