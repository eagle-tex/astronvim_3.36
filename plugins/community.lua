return {
  -- Add the community repository of plugin specifications
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/motion/leap-nvim
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },

  { import = "astrocommunity.motion.hop-nvim" },
  -- { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.mini-surround" },

  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
}
