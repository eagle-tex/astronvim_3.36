-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "bashls",
        "clangd",
        "cssls",
        "emmet_ls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "tsserver",
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        "black",
        "checkstyle",
        "commitlint",
        "cpplint",
        "editorconfig-checker",
        "eslint_d",
        "flake8",
        "google-java-format",
        "jsonlint",
        "prettierd",
        "stylua",
        "yamllint",
      })
    end,
  },
  -- {
  --   "williamboman/mason.nvim",
  --   require("mason").setup(),
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require "dap"
  --     dap.adapters["pwa-node"] = {
  --       type = "server",
  --       host = "localhost",
  --       port = "${port}",
  --       executable = {
  --         command = "node",
  --         -- 💀 Make sure to update this path to point to your installation
  --         args = {
  --           "/home/gildas/.local/share/astronvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
  --           -- vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
  --           "${port}",
  --         },
  --       },
  --       enrich_config = function()
  --         -- nothing for now
  --       end,
  --     }
  --
  --     dap.configurations.javascript = {
  --       {
  --         type = "pwa-node",
  --         request = "launch",
  --         name = "Launch file",
  --         program = "${file}",
  --         cwd = "${workspaceFolder}",
  --       },
  --     }
  --   end,
  -- },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    require("mason-nvim-dap").setup(),
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      -- opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      --   "bash-debug-adapter",
      --   "chrome-debug-adapter",
      --   "cpptools",
      --   "java-debug-adapter",
      --   "js-debug-adapter",
      --   "node-debug2-adapter",
      --   "python",
      -- })
      opts = {
        ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
          "bash-debug-adapter",
          "chrome-debug-adapter",
          "cpptools",
          "java-debug-adapter",
          "js-debug-adapter",
          "node-debug2-adapter",
          "python",
        }),

        handlers = {
          -- python = function(source_name)
          --   local dap = require "dap"
          --   dap.adapters.python = {
          --     type = "executable",
          --     command = "/usr/bin/python3",
          --     args = {
          --       "-m",
          --       "debugpy.adapter",
          --     },
          --     enrich_config = function()
          --       -- nothing for now
          --     end,
          --   }
          --
          --   dap.configurations.python = {
          --     {
          --       type = "python",
          --       request = "launch",
          --       name = "Launch file",
          --       program = "${file}", -- This configuration will launch the current file if used.
          --     },
          --   }
          -- end,
          --
          -- javascript = function()
          --   local dap = require "dap"
          --   dap.adapters["pwa-node"] = {
          --     type = "server",
          --     host = "localhost",
          --     port = "${port}",
          --     executable = {
          --       command = "node",
          --       -- 💀 Make sure to update this path to point to your installation
          --       args = { "/home/gildas/.local/share/debug-dap/js-debug/src/dapDebugServer.js", "${port}" },
          --     },
          --     enrich_config = function()
          --       -- nothing for now
          --     end,
          --   }
          --
          --   dap.configurations.javascript = {
          --     {
          --       type = "pwa-node",
          --       request = "launch",
          --       name = "Launch file",
          --       program = "${file}",
          --       cwd = "${workspaceFolder}",
          --     },
          --   }
          -- end,
        },
      }
    end,
  },
}
