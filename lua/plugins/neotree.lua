return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function ()
        vim.cmd([[
          augroup OpenNeoTreeOnStartup
            autocmd!
            autocmd VimEnter * Neotree filesystem reveal left
          augroup END
        ]])
        vim.keymap.set('n', '<leader>o', ':Neotree filesystem reveal left<CR>', { desc = 'Toggle neotree to the left' })
    end
}

