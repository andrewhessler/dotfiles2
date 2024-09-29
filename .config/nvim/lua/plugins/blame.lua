return {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    opts = {
        enabled = true,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M:%S",
        virtual_text_column = 1,
    },
    keys = {
        -- Chat with Copilot in visual mode
        {
            "<leader>gy",
            ":GitBlameCopyFileURL<cr>",
            mode = "n",
            desc = "Copy commit URL",
        },
    }
}
