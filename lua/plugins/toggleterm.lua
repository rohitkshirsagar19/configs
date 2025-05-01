return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>tt]], -- Bind <leader>tt to toggle terminal
      shell = "bash -i", -- Use interactive bash to load ~/.bashrc
      direction = "float", -- Open terminal as a floating window
      size = 20, -- Size for horizontal/vertical terminals
    })
  end,
}
