local function edit_or_open()
  local api = require "nvim-tree.api"
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local api = require "nvim-tree.api"
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
  vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.close, opts("Close"))
  vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local nvimtree = require("nvim-tree")
      nvimtree.setup({
        on_attach = my_on_attach,
        view = { adaptive_size = true },
        update_focused_file = {
          enable = true
        },
        diagnostics = {
          enable = true,
        },
      })
      local api = require("nvim-tree.api")

      vim.keymap.set("n", "<C-e>", ":NvimTreeFocus<cr>", { silent = true, noremap = true })


      api.events.subscribe(api.events.Event.TreeOpen, function()
        local tree_winid = api.tree.winid()

        if tree_winid ~= nil then
          vim.api.nvim_set_option_value('statusline', ' ', { win = tree_winid })
        end
      end)
    end
  }
}
