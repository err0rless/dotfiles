-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Make comments italic while preserving original colors
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
    comment_hl.italic = true
    vim.api.nvim_set_hl(0, "Comment", comment_hl)
    vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#d4a5b9", italic = true, bold = true })
  end,
})

-- Apply to current colorscheme as well
local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
comment_hl.italic = true
vim.api.nvim_set_hl(0, "Comment", comment_hl)

-- Copilot suggestion color (light pink)
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#d4a5b9", italic = true, bold = true })

-- Change background color based on tmux pane focus
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#282828" }) -- gruvbox medium bg
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#3c3836" }) -- gruvbox bg1 (lighter gray)
  end,
})

