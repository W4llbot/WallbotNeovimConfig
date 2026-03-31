vim.api.nvim_create_user_command(
  'TelescopeConfig',
  function()
    require('telescope.builtin').find_files({
      cwd = vim.fn.stdpath('config')
    })
  end,
  { desc = 'Find files in Neovim config directory' }
)

return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	vim.keymap.set('n', '<leader>fi', builtin.git_files, { desc = 'Telescope find git files' })
	vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Telescope find symbols' })
	vim.keymap.set('n', '<leader>fi', builtin.git_files, { desc = 'Telescope find git files' })
	vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diagnostics' })

        vim.keymap.set('n', '<leader>fc', function()
                builtin.find_files({ cwd = vim.fn.stdpath('config') })
        end, { desc = 'Telescope find config files' })
    end
}
