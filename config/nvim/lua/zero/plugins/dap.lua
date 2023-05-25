local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>")

vim.keymap.set("n", "<leader>dar", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" }) -- Open the debug window

-- DAPUI configuration
dapui.setup({
  icons = { expanded = "▼", collapsed = "▶" },
  mappings = {
    expand = "<CR>",
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    elements = {
      { id = "scopes", size = 0.25 },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 0.25 },
    },
    size = 40,
    position = "left",
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom",
  },
  floating = {
    max_height = nil, -- default to 30% of your screen height
    max_width = nil, -- default to 40% of your screen width
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

vim.g.dap_virtual_text = false
vim.g.dap_virtual_text = true -- Enable virtual text (optional)

vim.keymap.set("n", "<leader>dbg", function()
  require("dapui").open()
end, { desc = "Debug window" })

-- DAP configuration
-- dap.defaults.keymaps["continue"] = "<F5>"
-- dap.defaults.keymaps["step_over"] = "<F10>"
-- dap.defaults.keymaps["step_into"] = "<F11>"
-- dap.defaults.keymaps["step_out"] = "<F12>"
-- dap.defaults.keymaps["toggle_breakpoint"] = "<leader>b"
-- dap.defaults.keymaps["set_breakpoint"] = "<leader>B"
-- dap.defaults.keymaps["repl_open"] = "<leader>dr"
-- dap.defaults.keymaps["run_last"] = "<leader>dl"

-- Rust configuration
dap.adapters.rust = {
  type = "executable",
  attach = {
    pidProperty = "pid",
    pidSelect = "ask",
  },
  command = "lldb-vscode",
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
  },
  name = "lldb",
}

dap.configurations.rust = {
  {
    type = "rust",
    name = "Debug",
    request = "launch",
    program = "${file}",
    args = {},
    cwd = vim.fn.getcwd(),
    sourceLanguages = { "rust" },
    stopOnEntry = false,
  },
}
