local config = require("fzf_project.config")
local history = require("fzf_project.utils.history")
local M = {}

M.setup = config.setup
M.get_recent_projects = history.get_recent_projects

return M
