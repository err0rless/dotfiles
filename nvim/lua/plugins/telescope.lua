return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        sorting_strategy = "ascending",
        prompt_prefix = "  \u{f002}  ",
        winblend = 0,
      },
    },
  },
  {
    "AstroNvim/astroui",
    opts = {
      highlights = {
        init = function()
          local get_hlgroup = require("astroui").get_hlgroup
          local normal = get_hlgroup("Normal")
          local bg = normal.bg
          local prompt_bg = get_hlgroup("CursorLine").bg or get_hlgroup("Visual").bg
          local darker_bg = get_hlgroup("NormalFloat").bg or get_hlgroup("Pmenu").bg or bg
          local gruvbox_orange = get_hlgroup("GruvboxOrange") or { fg = "#fe8019" }
          local gruvbox_yellow = get_hlgroup("GruvboxYellow") or { fg = "#fabd2f" }

          return {
            TelescopeBorder = { fg = darker_bg, bg = darker_bg },
            TelescopeNormal = { bg = darker_bg },
            TelescopePreviewBorder = { fg = darker_bg, bg = darker_bg },
            TelescopePreviewNormal = { bg = darker_bg },
            TelescopePreviewTitle = { fg = darker_bg, bg = darker_bg },
            TelescopeResultsBorder = { fg = darker_bg, bg = darker_bg },
            TelescopeResultsNormal = { bg = darker_bg },
            TelescopeResultsTitle = { fg = darker_bg, bg = darker_bg },
            TelescopePromptBorder = { fg = prompt_bg, bg = prompt_bg },
            TelescopePromptNormal = { fg = normal.fg, bg = prompt_bg },
            TelescopePromptPrefix = { fg = "#FFB6C1", bg = prompt_bg, bold = true },
            TelescopePromptTitle = { fg = prompt_bg, bg = prompt_bg },
            TelescopePromptCounter = { fg = normal.fg, bg = prompt_bg, bold = true },
            TelescopeMatching = { fg = gruvbox_orange.fg, bold = true },
            TelescopeSelection = { bg = get_hlgroup("CursorLine").bg, bold = true },
          }
        end,
      },
    },
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("egrepify")
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>fw"] = {
            function() require("telescope").extensions.egrepify.egrepify({}) end,
            desc = "Live grep (egrepify)",
          },
        },
      },
    },
  },
}
