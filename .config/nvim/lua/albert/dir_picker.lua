local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local conf = require("telescope.config").values

_G.TELESCOPE_IGNORE_DIRS = {
    ".android/", ".cache/", ".cargo/", ".ccache/", ".cisco/", ".cmake/", ".docker", ".venv",
    ".cpan/", ".dotnet/", ".fltk/", ".fonts/", ".gnupg/", ".gradle/", ".ipynb_checkpoints/", ".screenlayout",
    ".ipython/", ".java/", ".julia/", ".jupyter/", ".local/", ".m2/", ".mozilla/", ".mplayer/",
    ".npm/", ".parallel/", ".pki/", ".platformio/", ".rest-client/", ".ssh/", ".steam/", "backups/",
    ".texlive/", ".var/", ".vpn/", ".vscode/", ".vscode-oss/", ".vysor/", ".wine/", ".yarn/", "software/",
    ".zoom/", ".zotero/", ".git/", ".astro/", ".obsidian/", "go/", "node_modules", "target", "dist", "build",
}

local tree_previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
        return { "tree", "-L", "1", entry.value }
    end,
})

local function fave_sorter()
    local default_sorter = conf.generic_sorter()

    return sorters.new({
        scoring_function = function(_, prompt, line)
            if (not prompt or prompt == "") and line:find("git/hobby") then
                return 0
            end
            return default_sorter:scoring_function(prompt, line)
        end,
    })
end

local function is_valid_depth(path)
    local hobby_prefix = "git/hobby"
    if path:find("^" .. hobby_prefix) then
        local subpath = path:sub(#hobby_prefix + 2)
        local depth = 0
        for _ in subpath:gmatch("[^/]+") do
            depth = depth + 1
        end
        return depth <= 2
    end
    return true
end

local function find_directory_picker(opts)
    opts = opts or {}

    local fd_command = { "fd", "--type", "d", "--hidden", "--no-ignore" }
    for _, dir in ipairs(_G.TELESCOPE_IGNORE_DIRS) do
        table.insert(fd_command, "--exclude")
        table.insert(fd_command, dir)
    end

    pickers.new(opts, {
        prompt_title = "Find Directory",
        finder = finders.new_oneshot_job(fd_command, {
            entry_maker = function(line)
                local trimmed_line = vim.trim(line)
                if not is_valid_depth(trimmed_line) then
                    return nil
                end
                return {
                    value = trimmed_line,
                    display = trimmed_line,
                    ordinal = trimmed_line,
                }
            end,
        }),
        sorter = fave_sorter(),
        previewer = tree_previewer,
    }):find()
end

local M = {}
M.find_directory_picker = find_directory_picker
return M
