return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { leap = true } },
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    -- Or, with AstroCommunity
    -- {
    --    "AstroNvim/astrocommunity",
    --    { import = "astrocommunity.git.git-blame-nvim" },
    -- },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", desc = "TodoTrouble" },
      { "<leader>Tt", "<cmd>TodoTrouble<cr>", desc = "List all project Todos in Trouble" },
      { "<leader>Ts", "<cmd>TodoTelescope<cr>", desc = "Search through project Todos" },
      { "<leader>Tl", "<cmd>TodoLocList<cr>", desc = "TODOs loclist" },
      { "<leader>Tq", "<cmd>TodoQuickFix<cr>", desc = "TODOs quickfix" },
    },
    -- require("todo-comments").setup {}
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    -- event = "User AstroFile",
    event = "BufRead",
    -- config = function() require("todo-comments").setup {} end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { "<leader>x", desc = "Diagnostics" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Loclist" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
    -- Or, with AstroCommunity
    -- {
    --    "AstroNvim/astrocommunity",
    --    { import = "astrocommunity.diagnostics.trouble-nvim" },
    -- },
  },

  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  {
    "folke/which-key.nvim",
    config = function(plugin, opts)
      require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- Add bindings which show up as group name
      local wk = require "which-key"
      wk.register({
        b = { name = "Buffer" },
        -- T = { name = "TodoTelescope" },
      }, { mode = "n", prefix = "<leader>" })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {},
    -- Or, with AstroCommunity
    -- {
    --    "AstroNvim/astrocommunity",
    --    { import = "astrocommunity.debugging.nvim-bqf" },
    -- },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
      -- https://github.com/kylechui/nvim-surround/issues/253
      keymaps = {
        normal = "ys",
        delete = "ds",
        visual = "S",
        visual_line = "gS",
        change = "cs",
        change_line = "cS",
      },

      -- https://github.com/ggandor/leap.nvim/discussions/59
      -- keymaps = {
      --   insert = "<C-g>z",
      --   insert_line = "gC-ggZ",
      --   normal = "gz",
      --   normal_cur = "gZ",
      --   normal_line = "gzz",
      --   normal_cur_line = "gZZ",
      --   visual = "gz",
      --   visual_line = "gZ",
      --   delete = "gzd",
      --   change = "gzr",
      -- },
    },
    -- Or, with AstroCommunity
    -- {
    --    "AstroNvim/astrocommunity",
    --    { import = "astrocommunity.motion.nvim-surround" },
    -- },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require("lsp_signature").setup(opts) end,
  },
  {
    {
      "Wansmer/treesj",
      -- keys = { "<space>m", "<space>j", "<space>s" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      keys = {
        { "<leader>J", desc = "Join" },
        { "<leader>Jm", "<cmd>TSJToggle<cr>", desc = "Trees toggle" },
        { "<leader>Jj", "<cmd>TSJJoin<cr>", desc = "Trees join" },
        { "<leader>Js", "<cmd>TSJSplit<cr>", desc = "Trees split" },
      },
      config = function() require("treesj").setup {} end,
      -- cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
      -- opts = { use_default_keymaps = false },
    },
  },

  -- TODO: Test
  -- FIX: Fix
  -- HACK: Hack
  -- PERF: Perf
  -- WARN: Warn
  -- NOTE: Note
  -- TEST: Test
  --
}
