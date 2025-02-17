local M = {}

---@param opts table|nil
---@return function
M.setup = function(opts)
  return function()
    opts = opts or {}

    local executables = {
      artisan = opts.artisan or { "php", "artisan" },
      composer = opts.composer or { "composer" },
      npm = opts.npm or { "npm" },
      yarn = opts.yarn or { "yarn" },
      php = opts.php or { "php" },
    }

    return {
      executables = vim.tbl_deep_extend("force", executables, opts.executables or {}),
    }
  end
end

return M
