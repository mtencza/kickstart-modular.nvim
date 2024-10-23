return {
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup {
        -- Style
        style = 'dark',

        -- Enable transparent background
        transparent = false,

        -- Enable italic comment
        italic_comments = true,

        -- Override highlight groups
        group_overrides = {
          -- Syntax
          typescriptAsyncFuncKeyword = { fg = c.vscBlue, bg = 'NONE' },

          -- Treesitter syntax highlight overrides
          ['@keyword.coroutine'] = { fg = c.vscPink },
        },
      }

      -- Ensure colorscheme is applied after setup
      vim.cmd.colorscheme 'vscode'
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      local function setup_rainbow_delimiters()
        -- Define the colors you want to use
        local colors = {
          '#C586C0', -- vscPink
          '#18a2fe', -- vscMediumBlue
          '#D7BA7D', -- vscYellowOrange
          '#C586C0', -- vscPink
          '#18a2fe', -- vscMediumBlue
          '#D7BA7D', -- vscYellowOrange
          '#C586C0', -- vscPink
          '#18a2fe', -- vscMediumBlue
        }

        vim.api.nvim_set_hl(0, 'RainbowDelimiter0', { fg = '#D7BA7D' })
        -- Create highlight groups
        for i, color in ipairs(colors) do
          vim.api.nvim_set_hl(0, 'RainbowDelimiter' .. i, { fg = color })
        end

        vim.g.rainbow_delimiters = {
          strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
          },
          query = {
            [''] = 'rainbow-delimiters',
            tsx = 'rainbow-parens',
            lua = 'rainbow-blocks',
          },
          -- highlight = vim.tbl_map(function(i)
          --   return 'RainbowDelimiter' .. i
          -- end, vim.fn.range(#colors)),
          highlight = {
            'RainbowDelimiter0',
            'RainbowDelimiter1',
            'RainbowDelimiter2',
          },
        }
      end

      -- Initial Setup
      setup_rainbow_delimiters()

      -- Reapply plugin when scheme changes
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = setup_rainbow_delimiters,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
