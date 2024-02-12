return {
  "jellydn/hurl.nvim",
  config = function()
    require("hurl").setup({
      dependencies = { "MunifTanjim/nui.nvim" },
      ft = "hurl",
      opts = {
        -- Show debugging info
        debug = false,
        -- Show notification on run
        show_notification = false,
        -- Show response in popup or split
        mode = "split",
        -- Default formatter
        formatters = {
          json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
          html = {
            "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
            "--parser",
            "html",
          },
        },
      },
    })
  end,
  keys = {
    -- Run API request
    { "<leader>wA",  "<cmd>HurlRunner<CR>",        desc = "Run All requests" },
    { "<leader>wa",  "<cmd>HurlRunnerAt<CR>",      desc = "Run Api request" },
    { "<leader>wte", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
    { "<leader>wtm", "<cmd>HurlToggleMode<CR>",    desc = "Hurl Toggle Mode" },
    { "<leader>wtv", "<cmd>HurlVerbose<CR>",       desc = "Run Api in verbose mode" },
    -- Run Hurl request in visual mode
    { "<leader>wh",  ":HurlRunner<CR>",            desc = "Hurl Runner",             mode = "v" },
  },
}
