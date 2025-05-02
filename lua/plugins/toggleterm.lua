return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>tt]], -- Toggle any terminal
      shell = "bash -i",             -- Use interactive shell
      direction = "float",           -- Float terminal by default
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        elseif term.direction == "float" then
          return 20
        end
      end,
      float_opts = {
        border = "curved",           -- Nice rounded border
        width = function()
          return math.floor(vim.o.columns * 0.8)  -- 80% of window width
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)    -- 80% of window height
        end,
      },
    })

    -- Lazygit integration using ToggleTerm
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "double",
        width = math.floor(vim.o.columns * 0.9),   -- Larger window for LazyGit
        height = math.floor(vim.o.lines * 0.9),
      },
      on_open = function(term)
        vim.cmd("startinsert!")  -- Start in insert mode
        -- Ensure LazyGit keybindings work
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function(term)
        -- Do not force insert mode; let the user stay in their current mode
      end,
    })

    -- Check if lazygit is installed
    local function lazygit_toggle()
      if vim.fn.executable("lazygit") == 1 then
        lazygit:toggle()
      else
        vim.notify("lazygit not found. Please install it: https://github.com/jesseduffield/lazygit#installation", vim.log.levels.ERROR)
      end
    end

    -- Keybinding to open LazyGit
    vim.keymap.set("n", "<leader>gg", lazygit_toggle, { noremap = true, silent = true, desc = "Toggle LazyGit" })

    -- Additional terminal keybinding for sending lines
    vim.keymap.set("n", "<leader>ts", ":ToggleTermSendCurrentLine<CR>", { noremap = true, silent = true, desc = "Send Line to Terminal" })
    vim.keymap.set("v", "<leader>ts", ":ToggleTermSendVisualLines<CR>", { noremap = true, silent = true, desc = "Send Selected Lines to Terminal" })
  end,
}