return {
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        close_tag = {
          enable = true, -- Enable auto-closing tags
        },
        rename_tag = {
          enable = true, -- Enable renaming tags
        },
        close_on_slash = {
          enable = false, -- Disable auto-closing on trailing </
        },
      }
    end,
  },
}
