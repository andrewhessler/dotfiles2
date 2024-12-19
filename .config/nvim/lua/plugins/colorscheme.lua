return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        transparent_background = true,
        no_italic = true,
      })
      local color_override = "catppuccin"
      vim.cmd.colorscheme(color_override)

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#23344d" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#334444", fg = "none" })
      -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#334444", fg = "#EE7722" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
    end
  }
}
