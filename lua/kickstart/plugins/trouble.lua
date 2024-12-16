return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    icons = {
      indent = {
        middle = ' ',
        last = ' ',
        top = ' ',
        ws = '│ ',
      },
    },
    modes = {
      diagnostics = {
        groups = {
          { 'filename', format = '{file_icon} {basename:Title} {count}' },
        },
        preview = {
          type = 'split',
          relative = 'win',
          position = 'right',
          size = 0.3,
        },
        win = {
          position = 'bottom',
          size = { height = 10 },
        },
        focus = true, -- Change focus to Trouble window by default
      },
    },
  },
  config = function(_, opts)
    local trouble = require 'trouble'
    trouble.setup(opts)

    local function toggle_trouble(bufnr)
      bufnr = bufnr or 0 -- Default to current buffer if not specified

      -- If Trouble is open, close it
      if trouble.is_open() then
        trouble.close()
        return
      end

      -- Open Trouble diagnostics for the specified buffer
      trouble.open('diagnostics', {
        mode = 'diagnostics',
        filter = { buf = bufnr },
      })

      -- Explicitly set focus to Trouble window
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == 'trouble' then
          vim.api.nvim_set_current_win(win)
          break
        end
      end
    end

    -- Ensure the key mappings are set up immediately
    vim.keymap.set('n', '<leader>xx', function()
      toggle_trouble()
    end, { desc = 'Toggle Diagnostics (Trouble)', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>xX', function()
      toggle_trouble(0)
    end, { desc = 'Buffer Diagnostics (Trouble)', noremap = true, silent = true })

    -- Add custom mapping in Trouble buffer to go to location
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'trouble',
      callback = function()
        vim.keymap.set('n', '<CR>', function()
          trouble.jump_to_location()
        end, { buffer = true, desc = 'Go to diagnostic location' })
      end,
    })
  end,
  keys = {
    { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
    { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references / ...' },
    { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
    { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
  },
}
