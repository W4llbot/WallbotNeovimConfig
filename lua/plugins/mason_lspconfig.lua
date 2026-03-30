vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function()
                vim.keymap.set("n", "<leader>gh", ":ClangdSwitchSourceHeader<CR>", { buffer = true, desc = "Go to Header/Source" })
        end,
})

return {
        "mason-org/mason-lspconfig.nvim",
        opts = {
                ensure_installed = {
                        "lua_ls",
                        "clangd"
                },
        },
        dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
        },
}
