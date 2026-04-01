return {
        "mfussenegger/nvim-dap",
        dependencies = {
                "rcarriga/nvim-dap-ui",
                "nvim-neotest/nvim-nio",
                "theHamsta/nvim-dap-virtual-text",
                "williamboman/mason.nvim",
                "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
                local dap = require("dap")
                local dapui = require("dapui")

                dapui.setup()
                require("mason-nvim-dap").setup( {
                        ensure_installed = { "codelldb" },
                        handlers = {
                                function(config)
                                        require('mason-nvim-dap').default_setup(config)
                                end,
                        },
                        automatic_installation = true,
                } );
                require("nvim-dap-virtual-text").setup({});

                dap.adapters.gdb = {
                        type = "executable",
                        command = "gdb",
                        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
                }

                dap.configurations.c = {
                        {
                                name = "Launch File",
                                type = "codelldb",
                                request = "launch",
                                program = function()
                                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                                end,
                                args = {},
                                cwd = "${workspaceFolder}",
                                stopAtEntry = false,
                                stopAtBeginningOfMainSubprogram = false,
                                MIMode = "gdb",
                        },
                }

                dap.configurations.cpp = dap.configurations.c

                -- Essential Debugging Control
                vim.keymap.set('n', '<F5>', dap.continue, { desc = "Debug: Start/Continue" })
                vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Debug: Step Over" })
                vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Debug: Step Into" })
                vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Debug: Step Out" })

                -- Breakpoint Management
                vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
                vim.keymap.set('n', '<leader>B', function()
                        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
                end, { desc = "Debug: Set Conditional Breakpoint" })

                -- UI and Session Management
                vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "Debug: Toggle UI" })
                vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = "Debug: Terminate Session" })
                vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = "Debug: Toggle REPL" })

                -- Automatically open/close UI
                dap.listeners.before.attach.dapui_config = function() dapui.open() end
                dap.listeners.before.launch.dapui_config = function() dapui.open() end
                dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
                dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
        end
}
