return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'vscode',
          globalstatus = true,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
