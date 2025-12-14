return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = require("telescope.themes").get_ivy({
        layout_config = { height = 0.5 },
      }),
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
