return {
  {
    'sindrets/diffview.nvim',
    config = function()
      local map = vim.api.nvim_set_keymap

      map('n', '<leader>gd', ':DiffviewOpen origin/HEAD...HEAD --imply-local<CR>', { noremap = true, silent = true, desc = '[D]iff against branch HEAD' })

      map('n', '<leader>go', ':DiffviewOpen <CR>', { noremap = true, silent = true, desc = 'Diffview [O]pen' })
      map('n', '<leader>gc', ':DiffviewClose<CR>', { noremap = true, silent = true, desc = '[C]lose Diffview' })
      map('n', '<leader>gf', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true, desc = '[F]ile history' })
    end,
  },
}
