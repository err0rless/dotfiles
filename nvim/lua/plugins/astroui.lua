-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- colorscheme = "nord",
    -- colorscheme = "catppuccin",
    colorscheme = "gruvbox",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
      gruvbox = function()
        local get_hlgroup = require("astroui").get_hlgroup
        local green_bold = get_hlgroup("GruvboxGreenBold")
        local blue_bold = get_hlgroup("GruvboxBlueBold")

        return {
          -- Fix status bar fg/bg issue in gruvbox
          StatusLine = { fg = get_hlgroup("Normal").fg, bg = get_hlgroup("StatusLine").bg },
          -- Add italic to C++ method calls and properties
          ["@lsp.type.method.cpp"] = vim.tbl_extend("force", green_bold, { italic = true }),
          ["@lsp.type.property.cpp"] = vim.tbl_extend("force", blue_bold, { italic = true }),
        }
      end,
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
