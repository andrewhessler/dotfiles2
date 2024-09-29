return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-jest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require('neotest-jest')({
                    jestCommand = "node node_modules/.bin/jest",
                    jestConfigFile = "jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
            },
            output = { open_on_run = true },
        })
        vim.keymap.set("n", "<leader>to",
            function() require("neotest").output.open({ enter = true, auto_close = true }) end)
        vim.keymap.set("n", "<leader>rt", function() require("neotest").run.run() end)
    end
}
