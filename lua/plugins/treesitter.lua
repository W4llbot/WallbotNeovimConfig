local parser_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/site")

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
	require("nvim-treesitter").setup({
	    install_dir = parser_path,
	    highlight = { enabled = true },
	    indent = { enabled = true },
	    auto_tage = { enabled = true },
	    auto_install = false,
	})
	require("nvim-treesitter").install {
	    "rust",
	    "javascript",
	    "zig",
	    "lua",
	    "vim",
	    "c",
	    "cpp",
	    "c_sharp",
	    "python",
	    "json",
	    "glsl",
	    "markdown",
	}
    end
}
