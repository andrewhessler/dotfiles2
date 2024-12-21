return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    -- branch = "canary", -- Use the canary branch if you want to test the latest features but it might be unstable
    version = "v3.3.3",
    -- Do not use branch and version together, either use branch or version
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      auto_follow_cursor = false, -- Don't follow the cursor after getting response
      show_help = false,          -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
      mappings = {
        close = {
          normal = "q",
          insert = "", -- removing this makes my <C-c> close the <leader>at window
        },
      }
    },
    config = function(_, opts)
      local copilot = require("copilot")
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      copilot.setup()
      -- Use unnamed register for the selection
      opts.selection = select.unnamed
      chat.setup(opts)

      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Custom buffer for CopilotChat
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          -- Get current filetype and set it to markdown if the current filetype is copilot-chat
          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })
    end,
    event = "VeryLazy",
    keys = {
      -- Chat with Copilot in visual mode
      {
        "<leader>at",
        ":CopilotChatVisual<cr>",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      -- Clear buffer and chat history
      { "<leader>ac", "<cmd>CopilotChatReset<cr>",  desc = "CopilotChat - Clear buffer and chat history" },
      -- Toggle Copilot Chat Vsplit
      { "<leader>at", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
    },
  },
}
