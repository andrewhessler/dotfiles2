return {
    {
        "folke/tokyonight.nvim",
        opts = {},
        dependencies = {
            { "oxfist/night-owl.nvim", opts = {} },
        },
        config = function()
            color = color or "night-owl" or "tokyonight"
            vim.cmd.colorscheme(color)

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#334444", fg = "none" })
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#334444", fg = "#EE7722" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
        end
    }
}
