return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    init = function() 
        require("nvim-treesitter").setup({
        -- enable syntax highlighting
        highlight = {
            enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "graphql",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "tsx",
            "typescript",
            "vim",
            "yaml",
            -- errors with gitignore
            -- "gitignore",
        },
        -- auto install above language parsers
        auto_install = true,
    })
    end
}