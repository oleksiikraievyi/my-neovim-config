return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            'mfussenegger/nvim-dap',
        },
        config = function ()
            require("dapui").setup()

            local dap = require('dap')
            local dapui = require('dapui')

            dap.adapters.python = {
                type = 'executable',
                command = 'python',
                args = {'-m', 'debugpy.adapter'}
            }
            dap.configurations.python = {
                {
                    type = 'python',
                    require = 'launch',
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function() return './venv/bin/python' end,
                },
            }

            dap.listeners.before.attach.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              dapui.close()
            end

            vim.keymap.set('n', '<F5>', dap.continue, {})
            vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, {})
        end
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-python",
        },
        config = function ()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-python")({
                        runnner = "pytest",
                        python = "./venv/bin/python",
                    })
                }
            })

            vim.api.nvim_create_user_command("DebugTest", "lua require('neotest').run.run({strategy = 'dap'})", {})
        end
    }
}
