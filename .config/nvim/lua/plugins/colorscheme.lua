return {
    { "ellisonleao/gruvbox.nvim", opts = {} },
    { "rose-pine/neovim",         name = "rose-pine" },
    { "oxfist/night-owl.nvim",    opts = {} },
    {
        "folke/tokyonight.nvim",
        opts = {},
        config = function()
            color = color or "night-owl" or "tokyonight"
            vim.cmd.colorscheme(color)

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
        end
    }
}
