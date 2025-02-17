local M = {}

---@param opts table|nil
---@return function
M.setup = function(opts)
  return function()
    opts = opts or {}

    local cmd = opts.cmd or { "ddev" }

    local function get_cmd(args)
      return vim.fn.extend(cmd, args)
    end

    local executables = {
      artisan = opts.artisan or get_cmd { "artisan" },
      composer = opts.composer or get_cmd { "composer" },
      npm = opts.npm or get_cmd { "npm" },
      yarn = opts.yarn or get_cmd { "yarn" },
      sail = opts.sail or cmd,
      php = opts.php or get_cmd { "php" },
    }

    return {
      executables = vim.tbl_deep_extend("force", executables, opts.executables or {}),
    }
  end
end

return M
