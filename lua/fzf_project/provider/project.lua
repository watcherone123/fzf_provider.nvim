local history = require("fzf_project.utils.history")
local project = require("fzf_project.project")
local config = require("fzf_project.config")
local fzf_lua = require "fzf-lua"

local function recent_projects()
    local results = history.get_recent_projects()
    -- Reverse results
    for i = 1, math.floor(#results / 2) do
        results[i], results[#results - i + 1] = results[#results - i + 1], results[i]
    end
    return results
end

return function()
    local contets = function(fzf_cb)
        local table = recent_projects()
        for i, value in ipairs(table) do
            fzf_cb(value)
        end
        fzf_cb() -- close the fzf named pipe, this signals EOF and terminates the fzf "loading" indicator.
    end

    local actions = {
        ["default"] = require 'fzf-lua'.actions.file_edit,
    }
    local opts = {
        prompt = "Projects >",
        actions = actions,
    }
    return fzf_lua.fzf_exec(contets, opts)
end
