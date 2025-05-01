return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():append()
    end, { desc = "Add File to Harpoon" })
    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu()
    end, { desc = "Harpoon Menu" })
    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Go to File 1" })
    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Go to File 2" })
  end,
}
