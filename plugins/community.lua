return {
  -- Add the community repository of plugin specifications
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/motion/leap-nvim
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.motion.leap-nvim" },
}
