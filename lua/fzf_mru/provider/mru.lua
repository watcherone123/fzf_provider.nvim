local mru = require "fzf_mru"
local fzf_lua = require "fzf-lua"

local function prepare_output_table()
    local lines = vim.deepcopy(mru.get())
    return lines
end


return function()
    local contets = function(fzf_cb)
        local table = prepare_output_table()
        for _, value in ipairs(table) do
            fzf_cb(value)
        end
        fzf_cb() -- close the fzf named pipe, this signals EOF and terminates the fzf "loading" indicator.
    end

    local actions = {
        ["default"] = require'fzf-lua'.actions.file_edit,
    }
    local opts = {
        prompt = "Recent Files >",
        actions = actions,
    }
    return fzf_lua.fzf_exec(contets, opts)
end
