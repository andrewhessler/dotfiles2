return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-telescope/telescope-dap.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require('telescope.builtin')
            local lga_actions = require("telescope-live-grep-args.actions")
            local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<C-f>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
            vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>')
            vim.keymap.set("n", "<leader>gg", live_grep_args_shortcuts.grep_word_under_cursor)

            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            telescope.setup({
                extensions = {
                    live_grep_args = {
                        auto_quoting = true,
                        mappings = {
                            i = {
                                ["<C-k>"] = lga_actions.quote_prompt(),
                                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                                -- freeze the current list and start a fuzzy search in the frozen list
                                ["<C-space>"] = lga_actions.to_fuzzy_refine,
                            }
                        }
                    },
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.8,
                        },
                    }
                }
            })
            telescope.load_extension("dap")
            telescope.load_extension("undo")
            telescope.load_extension("live_grep_args")
        end
    },
}
