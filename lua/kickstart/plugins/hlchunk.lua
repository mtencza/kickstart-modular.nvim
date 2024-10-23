return {
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup {
        chunk = {
          enable = true,
          -- style = '#4FC1FF', -- vscAccentBlue
          style = '#C586C0', -- vscPink
          use_treesitter = true,
          chars = {
            horizontal_line = '─',
            vertical_line = '│',
            left_top = '╭',
            left_bottom = '╰',
            right_arrow = '-',
            duration = 200,
            delay = 300,
          },
        },
        line_num = {
          enable = true,
          style = '#C586C0', -- vscPink
          use_treesitter = true,
          chars = {
            horizontal_line = '─',
            vertical_line = '│',
            left_top = '╭',
            left_bottom = '╰',
            right_arrow = '>',
          },
        },
      }
    end,
  },
}
