vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_italic = 1

return {
  -- "ellisonleao/gruvbox.nvim"
  "morhetz/gruvbox",
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "gruvbox",
      callback = function()
        vim.defer_fn(function()
          -- Copy GruvboxGreenBold and add italic for method calls and properties
          local green_bold = vim.api.nvim_get_hl(0, { name = "GruvboxGreenBold", link = false })
          if next(green_bold) then
            green_bold.italic = true
            vim.api.nvim_set_hl(0, "@lsp.type.method.cpp", green_bold)
            vim.api.nvim_set_hl(0, "@lsp.type.property.cpp", green_bold)
          end
        end, 0)
      end,
    })
  end,
}

