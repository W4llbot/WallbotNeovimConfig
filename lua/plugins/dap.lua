return {
        "mfussenegger/nvim-dap",
        dependencies = {
                "rcarriga/nvim-dap-ui",
                "nvim-neotest/nvim-nio",
                "williamboman/mason.nvim",
                "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
                local dap = require("dap")
                local dapui = require("dapui")
                local mason_dap = require("mason-nvim-dap")
                dapui.setup()
                mason_dap.setup();


--                -- Automatically open/close UI
--                dap.listeners.before.attach.dapui_config = function() dapui.open() end
--                dap.listeners.before.launch.dapui_config = function() dapui.open() end
--                dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
--                dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
        end
}
