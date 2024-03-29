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
        "tailwindcss",
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
        -- "eslint_d",
        "flake8",
        "google-java-format",
        "jsonlint",
        "prettierd",
        "stylua",
      })
      -- opts.automatic_installation = { exclude = { "eslint-lsp" } } // added on 20231104 (remove to clean)
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "bash-debug-adapter",
        "chrome-debug-adapter",
        "cpptools",
        "java-debug-adapter",
        "js",
        "node-debug2-adapter",
        "python",
        "ts",
      })
    end,
  },
}
