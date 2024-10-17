return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "lua",
        "vimdoc",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "json",
        "json5",
        "yaml",
        "toml",
        "xml",
        "sql",
        "make",
        "csv",
        "tsv",
        "proto",
        "markdown",
        "mermaid",
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    init = function()
      local harpoon = require "harpoon"
      harpoon:setup()
      local map = vim.keymap.set

      map("n", "<leader>ap", function()
        harpoon:list():add()
      end, { desc = "Harpoon Mark File" })
      map("n", "<leader>rp", function()
        harpoon:list():remove()
      end, { desc = "Harpoon Remove Mark File" })
      map("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon Toogle Harpoon Menu" })

      map("n", "<C-1>", function()
        harpoon:list():select(1)
      end)
      map("n", "<C-2>", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon File 2" })
      map("n", "<C-3>", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon File 3" })
      map("n", "<C-4>", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon File 4" })
      map("n", "<C-5>", function()
        harpoon:list():select(5)
      end, { desc = "Harpoon File 5" })
      map("n", "<C-6>", function()
        harpoon:list():select(6)
      end, { desc = "Harpoon File 6" })
      map("n", "<C-7>", function()
        harpoon:list():select(7)
      end, { desc = "Harpoon File 7" })
      map("n", "<C-8>", function()
        harpoon:list():select(8)
      end, { desc = "Harpoon File 8" })
      map("n", "<C-9>", function()
        harpoon:list():select(9)
      end, { desc = "Harpoon File 9" })
      map("n", "<C-0>", function()
        harpoon:list():select(0)
      end, { desc = "Harpoon File 10" })

      -- Toggle previous & next buffers stored within Harpoon list
      map("n", "<C-S-P>", function()
        harpoon:list():prev()
      end, { desc = "Harpoon Prev buffer" })
      map("n", "<C-S-N>", function()
        harpoon:list():next()
      end, { desc = "Harpoon Next buffer" })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      local map = vim.keymap.set
      map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debug Add breakpoint at line" })
      map("n", "<leader>dus", function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end, { desc = "Debug Open debugging sidebar" })
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      local map = vim.keymap.set
      map("n", "<leader>dgt", function()
        require("dap-go").debug_test()
      end, { desc = "Debug Go test" })
      map("n", "<leader>dgl", function()
        require("dap-go").debug_last()
      end, { desc = "Debug Last go test" })
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      local map = vim.keymap.set
      map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "GO Add json struct tags" })
      map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "GO Add yaml struct tags" })
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "vim-test/vim-test",
    lazy = false,
    config = function()
      local map = vim.keymap.set
      map("n", "<leader>tf", ":TestFile<CR>", { desc = "Test Run test in this file" })
      map("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test Run the test suite" })
      map("n", "<leader>tl", ":TestLast<CR>", { desc = "Test Run the last test" })
      map("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test Run the nearest test" })
      map("n", "<leader>tv", ":TestVisit<CR>", { desc = "Test Visit the last test" })
    end,
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    init = function()
      require("aerial").setup({
        manage_folds = true,
        layout = {
          -- These control the width of the aerial window.
          -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a list of mixed types.
          -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
          max_width = { 50, 0.6 },
          width = nil,
          min_width = 10,

          -- key-value pairs of window-local options for aerial window (e.g. winhl)
          win_opts = {},

          -- Determines the default direction to open the aerial window. The 'prefer'
          -- options will open the window in the other direction *if* there is a
          -- different buffer in the way of the preferred direction
          -- Enum: prefer_right, prefer_left, right, left, float
          default_direction = "prefer_right",

          -- Determines where the aerial window will be opened
          --   edge   - open aerial at the far right/left of the editor
          --   window - open aerial to the right/left of the current window
          placement = "window",

          -- When the symbols change, resize the aerial window (within min/max constraints) to fit
          resize_to_content = true,

          -- Preserve window size equality with (:help CTRL-W_=)
          preserve_equality = false,
        },
        float = {
          border = "rounded",
          relative = "editor",
          max_height = 0.9,
          height = nil,
          min_height = { 8, 0.1 },

        },
        -- Options for the floating nav windows
        nav = {
          border = "rounded",
          max_height = 0.9,
          min_height = { 10, 0.1 },
          max_width = 0.8,
          min_width = { 0.2, 20 },
          win_opts = {
            cursorline = true,
            winblend = 10,
          },
          -- Jump to symbol in source window when the cursor moves
          autojump = false,
          -- Show a preview of the code in the right column, when there are no child symbols
          preview = true,
          -- Keymaps in the nav window
          keymaps = {
            ["<CR>"] = "actions.jump",
            ["<2-LeftMouse>"] = "actions.jump",
            ["<C-v>"] = "actions.jump_vsplit",
            ["<C-s>"] = "actions.jump_split",
            ["h"] = "actions.left",
            ["l"] = "actions.right",
            ["<C-c>"] = "actions.close",
          },
        },
        on_attach = function(bufnr)
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial Prev" })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial Next" })
          vim.keymap.set("n", "<leader>o", "<cmd>AerialNavToggle<CR>", { desc = "Aerial Toggle" })
        end,
      })
    end,
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  }
}
