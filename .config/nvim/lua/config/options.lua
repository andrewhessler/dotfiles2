vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false
vim.o.mouse = 'a'

vim.o.autowrite = true
-- vim.o.clipboard = "unnamedplus"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldcolumn = "0"
vim.o.foldlevelstart = 1
vim.o.foldlevel = 99
vim.o.foldnestmax = 20

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.isfname = vim.o.isfname .. ",@-@"

vim.o.updatetime = 50

vim.o.colorcolumn = ""
vim.o.cursorline = true

vim.g.have_nerd_font = true

vim.diagnostic.config {
    float = { border = "rounded" },
}
