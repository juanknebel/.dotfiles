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
        "vimdoc",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "json",
        "yaml",
        "xml",
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
      end, { desc = "Harpoon: Mark File" })
      map("n", "<leader>rp", function()
        harpoon:list():remove()
      end, { desc = "Harpoon: Remove Mark File" })
      map("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon: Toogle Harpoon Menu" })

      map("n", "<C-1>", function()
        harpoon:list():select(1)
      end)
      map("n", "<C-2>", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon: File 2" })
      map("n", "<C-3>", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon: File 3" })
      map("n", "<C-4>", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon: File 4" })
      map("n", "<C-5>", function()
        harpoon:list():select(5)
      end, { desc = "Harpoon: File 5" })
      map("n", "<C-6>", function()
        harpoon:list():select(6)
      end, { desc = "Harpoon: File 6" })
      map("n", "<C-7>", function()
        harpoon:list():select(7)
      end, { desc = "Harpoon: File 7" })
      map("n", "<C-8>", function()
        harpoon:list():select(8)
      end, { desc = "Harpoon: File 8" })
      map("n", "<C-9>", function()
        harpoon:list():select(9)
      end, { desc = "Harpoon: File 9" })
      map("n", "<C-0>", function()
        harpoon:list():select(0)
      end, { desc = "Harpoon: File 10" })

      -- Toggle previous & next buffers stored within Harpoon list
      map("n", "<C-S-P>", function()
        harpoon:list():prev()
      end, { desc = "Harpoon: Prev buffer" })
      map("n", "<C-S-N>", function()
        harpoon:list():next()
      end, { desc = "Harpoon: Next buffer" })
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
}
