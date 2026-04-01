vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpActiveParameter', { link = 'Search' })

return {
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
                signature = {
                        enabled = true,
                        trigger = {
                                show_on_trigger_character = true,
                                show_on_insert_on_trigger_character = true,
                                show_on_keyword = true,
                        },
                        window = {
                                show_documentation = true,
                        }
                },
                completion = {
                        documentation = {
                                auto_show = true,          -- Show documentation for the selected item automatically
                                --auto_show_delay_ms = 200,   -- Delay before showing the window
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
        opts_extend = { "sources.default" },
}

