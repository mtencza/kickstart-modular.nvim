return {
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'askfiy/visual_studio_code',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      vim.cmd [[colorscheme visual_studio_code]]
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
