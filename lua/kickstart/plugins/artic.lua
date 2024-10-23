return {
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'rockyzhang24/arctic.nvim',
    branch = 'v2',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000, -- Make sure to load this before all the other start plugins.
  },
}
-- vim: ts=2 sts=2 sw=2 et
