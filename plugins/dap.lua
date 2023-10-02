return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text", config = true },
    },
    config = function()
      local dap = require "dap"

      -- Set keymaps to control the debugger
      vim.keymap.set("n", "<F5>", require("dap").continue)
      vim.keymap.set("n", "<F10>", require("dap").step_over)
      vim.keymap.set("n", "<F11>", require("dap").step_into)
      vim.keymap.set("n", "<F12>", require("dap").step_out)
      vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
      -- vim.keymap.set(
      --   "n",
      --   "<leader>B",
      --   function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end
      -- )

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- 💀 Make sure to update this path to point to your installation
          -- args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
          args = {
            -- "/home/gildas/.local/share/astronvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "/home/gildas/.local/share/debug-dap/vscode-js-debug/src/dapDebugServer.ts",
            -- vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
        enrich_config = function()
          -- nothing for now
        end,
      }

      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { os.getenv "HOME" .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
        enrich_config = function()
          -- nothing for now
        end,
      }

      -- for _, language in ipairs { "javascript", "typescript" } do
      dap.configurations.javascript = {
        {
          name = "Launch",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          -- For this to work you need to make sure the node process is started with the `--inspect` flag.
          name = "Attach to process",
          type = "node2",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
      -- end

      -- local js_based_languages = { "typescript", "javascript", "typescriptreact" }
      --
      -- for _, language in ipairs(js_based_languages) do
      --   require("dap").configurations[language] = {
      --     -- dap.configurations[language] = {
      --     {
      --       type = "pwa-node",
      --       request = "launch",
      --       name = "Launch file",
      --       program = "${file}",
      --       cwd = "${workspaceFolder}",
      --     },
      --     {
      --       type = "pwa-node",
      --       request = "attach",
      --       name = "Attach",
      --       processId = require("dap.utils").pick_process,
      --       cwd = "${workspaceFolder}",
      --     },
      --     {
      --       type = "pwa-chrome",
      --       request = "launch",
      --       name = 'Start Chrome with "localhost"',
      --       url = "http://localhost:3000",
      --       webRoot = "${workspaceFolder}",
      --       userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
      --     },
      --   }
      -- end
    end,
  },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    -- opts = {
    --
    --   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    --   -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    --   -- debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter", -- Path to vscode-js-debug installation.
    --   debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src", -- Path to vscode-js-debug installation.
    --   debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    --   adapters = {
    --     -- "chrome",
    --     -- "node",
    --     "pwa-node",
    --     "pwa-chrome",
    --     "pwa-msedge",
    --     "node-terminal",
    --     "pwa-extensionHost",
    --   }, -- which adapters to register in nvim-dap
    --   -- log_file_path = "(stdpath cache)/dap_vscode_js.log", -- Path for file logging
    --   -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    --   -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    -- },
    --
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    -- require("dap-vscode-js").setup {
    opts = {
      node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      -- debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter", -- Path to vscode-js-debug installation.
      -- debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
      debugger_path = "/home/gildas/.local/share/debug-dap/vscode-js-debug", -- Path to vscode-js-debug installation.
      debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = {
        -- "chrome",
        -- "node",
        "pwa-node",
        "pwa-chrome",
        "pwa-msedge",
        "node-terminal",
        "pwa-extensionHost",
      }, -- which adapters to register in nvim-dap
      log_file_path = "(stdpath cache)/dap_vscode_js.log", -- Path for file logging
      log_file_level = 0, -- Logging level for output to file. Set to false to disable file logging.
      log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
    },

    config = function()
      -- local dap = require "dap"

      -- local js_based_languages = { "typescript", "javascript", "typescriptreact" }
      --
      -- for _, language in ipairs(js_based_languages) do
      --   require("dap").configurations[language] = {
      --     -- dap.configurations[language] = {
      --     {
      --       type = "pwa-node",
      --       request = "launch",
      --       name = "Launch file",
      --       program = "${file}",
      --       cwd = "${workspaceFolder}",
      --     },
      --     {
      --       type = "pwa-node",
      --       request = "attach",
      --       name = "Attach",
      --       processId = require("dap.utils").pick_process,
      --       cwd = "${workspaceFolder}",
      --     },
      --     {
      --       type = "pwa-chrome",
      --       request = "launch",
      --       name = 'Start Chrome with "localhost"',
      --       url = "http://localhost:3000",
      --       webRoot = "${workspaceFolder}",
      --       userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
      --     },
      --   }
      -- end
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    require("dapui").setup(),
    -- opts = {},
    config = function()
      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open {} end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close {} end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close {} end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  --
}
