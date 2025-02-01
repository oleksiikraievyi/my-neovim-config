return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        require('nvim-treesitter.configs').setup({
            ensure_instaled = {"lua", "python", "go", "elixir"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

