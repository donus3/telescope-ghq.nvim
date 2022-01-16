local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local transform_mod = require('telescope.actions.mt').transform_mod

local M = {}

-- Extracts project path from current buffer selection
M.get_selected_path = function(prompt_bufnr)
  return actions_state.get_selected_entry(prompt_bufnr).value
end

M.change_dir = function(prompt_bufnr)
  local selected_path = M.get_selected_path(prompt_bufnr)
  actions.close(prompt_bufnr)
  vim.cmd('cd ' ..selected_path)
  print('cd ' ..selected_path)
  require('nvim-tree').focus()
end

return transform_mod(M)
