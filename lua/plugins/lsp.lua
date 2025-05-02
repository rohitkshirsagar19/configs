return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = { enabled = false },
            ruff = { enabled = true },
            black = { enabled = true },
            isort = { enabled = true },
          },
        },
      },
    })
    lspconfig.html.setup({})
    lspconfig.cssls.setup({})
    lspconfig.tsserver.setup({})
  end,
}
