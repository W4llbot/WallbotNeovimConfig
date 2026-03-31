vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function()
                vim.keymap.set("n", "<leader>gh", "<cmd>LspClangdSwitchSourceHeader<CR>", { buffer = true, desc = "Go to Header/Source" })
        end,
})

return {
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        { "williamboman/mason.nvim", config = true }, -- Mason must run before lspconfig
                        "williamboman/mason-lspconfig.nvim",
                        "saghen/blink.cmp", -- Dependency to ensure capabilities are available
                },
                config = function()
                        local lspconfig = require("lspconfig")
                        local mason_lspconfig = require("mason-lspconfig")

                        -- Get blink.cmp capabilities to pass to LSP servers
                        local capabilities = require('blink.cmp').get_lsp_capabilities()

                        mason_lspconfig.setup({
                                ensure_installed = {
                                        "lua_ls",
                                        "ts_ls",
                                        "clangd",
                                        "pyright",
                                }, -- Add your servers here
                                handlers = {
                                        -- Default handler for installed servers
                                        function(server_name)
                                                lspconfig[server_name].setup({
                                                        capabilities = capabilities,
                                                })
                                        end,
                                        -- Dedicated handlers for specific servers (optional)
--                                        ["lua_ls"] = function()
--                                                lspconfig.lua_ls.setup({
--                                                        capabilities = capabilities,
--                                                        settings = { Lua = { diagnostics = { globals = { "vim" } } } }
--                                                })
--                                        end,
                                },
                        })
                end,
        },

        {
                "saghen/blink.cmp",
                version = "*", -- Use a release tag to download pre-built binaries
                opts = {
                        keymap = { preset = 'default' }, -- Sets default keymaps for completion
                        appearance = {
                                use_nvim_cmp_as_default = true, -- Fallback for icons/highlights
                                nerd_font_variant = 'mono'
                        },
                        sources = {
                                default = { 'lsp', 'path', 'snippets', 'buffer' },
                        },
                        completion = {
                                documentation = {
                                        auto_show = true,          -- Show documentation for the selected item automatically
                                        auto_show_delay_ms = 200,   -- Delay before showing the window
                                },
                        },
   --                     keymap = {
   --                             -- Keybind to manually toggle the documentation window
   --                             ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
   --                             -- Keybinds to scroll the documentation window
   --                             ["<C-up>"] = { "scroll_documentation_up", "fallback" },
   --                             ["<C-down>"] = { "scroll_documentation_down", "fallback" },
   --                     },
                },
                opts_extend = { "sources.default" }
        },
}
