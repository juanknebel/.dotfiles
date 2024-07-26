return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  init = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- vim.keymap.set("n", "<leader>ha", function()
    vim.keymap.set("n", "<A-a>", function()
      harpoon:list():add()
    end, { desc = "Harpoon: Mark File" })
    vim.keymap.set("n", "<A-r>", function()
      harpoon:list():remove()
    end, { desc = "Harpoon: Remove Mark File" })
    vim.keymap.set("n", "<A-h>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toogle Harpoon Menu" })

    vim.keymap.set("n", "<C-1>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-2>", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon: File 2" })
    vim.keymap.set("n", "<C-3>", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon: File 3" })
    vim.keymap.set("n", "<C-4>", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon: File 4" })
    vim.keymap.set("n", "<C-5>", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon: File 5" })
    vim.keymap.set("n", "<C-6>", function()
      harpoon:list():select(6)
    end, { desc = "Harpoon: File 6" })
    vim.keymap.set("n", "<C-7>", function()
      harpoon:list():select(7)
    end, { desc = "Harpoon: File 7" })
    vim.keymap.set("n", "<C-8>", function()
      harpoon:list():select(8)
    end, { desc = "Harpoon: File 8" })
    vim.keymap.set("n", "<C-9>", function()
      harpoon:list():select(9)
    end, { desc = "Harpoon: File 9" })
    vim.keymap.set("n", "<C-0>", function()
      harpoon:list():select(0)
    end, { desc = "Harpoon: File 10" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
