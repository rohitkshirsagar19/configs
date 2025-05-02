return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
        project = {
          base_dirs = {
            "~/projects",
            "~/dsa",
          },
          hidden_files = false,
          order_by = "recent",
          sync_with_nvim_tree = true,
        },
      },
    })
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("project")
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Projects" },
  },
}