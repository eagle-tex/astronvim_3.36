return {
  -- Add the community repository of plugin specifications
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/motion/leap-nvim
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },

  { import = "astrocommunity.motion.hop-nvim" },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    opts = {},
    keys = function()
      local hop = require "hop"
      local directions = require("hop.hint").HintDirection
      return {
        {
          "s",
          function() require("hop").hint_words() end,
          mode = { "n" },
          desc = "Hop hint words",
        },
        {
          "<S-s>",
          function() require("hop").hint_lines() end,
          mode = { "n" },
          desc = "Hop hint lines",
        },
        {
          "s",
          function() require("hop").hint_words { extend_visual = true } end,
          mode = { "v" },
          desc = "Hop hint words",
        },
        {
          "<S-s>",
          function() require("hop").hint_lines { extend_visual = true } end,
          mode = { "v" },
          desc = "Hop hint lines",
        },

        {
          "f",
          function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true } end,
          mode = { "n" },
          desc = "Hop hint 1 char forward to",
        },
        {
          "<S-f>",
          function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true } end,
          mode = { "n" },
          desc = "Hop hint 1 char backward to",
        },
        {
          "t",
          function()
            hop.hint_char1 {
              direction = directions.AFTER_CURSOR,
              current_line_only = true,
              hint_offset = -1,
            }
          end,
          mode = { "n" },
          desc = "Hop hint 1 char forward before",
        },
        {
          "<S-t>",
          function()
            hop.hint_char1 {
              direction = directions.BEFORE_CURSOR,
              current_line_only = true,
              hint_offset = 1,
            }
          end,
          mode = { "n" },
          desc = "Hop hint 1 char backward before",
        },
      }
    end,
  },
  -- { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.mini-surround" },

  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },

  -- Find and replace
  { import = "astrocommunity.project.nvim-spectre" },
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>s", desc = "Search & Replace" },
      { "<leader>ss", '<cmd>lua require("spectre").toggle()<cr>', desc = "Toggle Spectre" },
      { "<leader>sp", '<cmd>lua require("spectre").toggle()<cr>', desc = "Search on Current File" },
      {
        "<leader>sw",
        '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
        desc = "Search Current Word",
      },
    },
  },
}
