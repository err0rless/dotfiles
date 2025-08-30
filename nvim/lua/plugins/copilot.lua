-- vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#e1c0b6" })
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#ffb961" })

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        -- Alt-a
        accept = "<M-a>",
      }
    },
    panel = { enabled = true, },
    filetypes = {
      markdown = true,
      help = true,
      rust = true,
      gitcommit = false,
      gitrebase = false,
    },
  },
}
