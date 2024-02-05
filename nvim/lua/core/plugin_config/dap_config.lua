-- Load dap and dapui modules
local dap, dapui = require("dap"), require("dapui")

-- Set up dapui
dapui.setup()

-- Open dapui after the debugger has been initialized
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- Close dapui before the debugger is terminated or exited
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Set up key mappings for debugging actions
vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>') -- Toggle breakpoint
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')        -- Terminate debugger
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')         -- Step over in debugger
