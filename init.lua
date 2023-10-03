return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- Add dap configurations
  -- dap = {
  --   configurations = {
  --     javascript = { -- set up javascript dap configuration
  --       {
  --         type = "pwa-node",
  --         request = "launch",
  --         name = "Launch file",
  --         program = "${file}",
  --         cwd = "${workspaceFolder}",
  --       },
  --       {
  --         type = "pwa-node",
  --         request = "attach",
  --         name = "Attach",
  --         processId = function(...) return require("dap.utils").pick_process(...) end, -- protect function
  --         cwd = "${workspaceFolder}",
  --       },
  --     },
  --     typescript = { -- set up typescript dap configuration (does it work??)
  --       -- {
  --       --   type = "pwa-node-ts",
  --       --   request = "launch",
  --       --   name = "Launch file",
  --       --   program = "${file}",
  --       --   cwd = "${workspaceFolder}",
  --       -- },
  --       -- {
  --       --   type = "pwa-node",
  --       --   request = "attach",
  --       --   name = "Attach",
  --       --   processId = function(...) return require("dap.utils").pick_process(...) end, -- protect function
  --       --   cwd = "${workspaceFolder}",
  --       -- },
  --       {
  --         type = "pwa-node-ts",
  --         request = "launch",
  --         name = "Launch file (Typescript)",
  --         sourceMaps = true,
  --         preLaunchTask = "tsc --project tsconfig.json",
  --         resolveSourceMapLocations = {
  --           "${workspaceFolder}/**",
  --           "!**/node_modules/**",
  --         },
  --         protocol = "inspector",
  --         skipFiles = { "<node_internals>/**" },
  --       },
  --       {
  --         type = "pwa-node-ts",
  --         request = "attach",
  --         name = "Attach",
  --         processId = function(...) return require("dap.utils").pick_process(...) end, -- protect function
  --         cwd = "${workspaceFolder}",
  --         sourceMaps = true,
  --         resolveSourceMapLocations = {
  --           "${workspaceFolder}/**",
  --           "!**/node_modules/**",
  --         },
  --       },
  --     },
  --   },
  -- },
  -- plugins = {
  --   init = {
  --     {
  --       "mxsdev/nvim-dap-vscode-js",
  --       after = "mason-nvim-dap.nvim", -- setup after mason which installs the debugger
  --       config = function()
  --         require("dap-vscode-js").setup {
  --           debugger_cmd = { "js-debug-adapter" }, -- mason puts command in path
  --           adapters = { "pwa-node", "pwa-node-ts" }, -- choose adapter, only node is fully tested
  --         }
  --       end,
  --     },
  --   },
  --   ["mason-nvim-dap"] = {
  --     ensure_installed = { "js" }, -- auto install js-debug-adapter
  --   },
  -- },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
