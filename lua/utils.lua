local M = {}
local wk = require("which-key")

M.load_mappings = function(plugin)
  plugin = plugin or "general"
  local M = require("mappings")
  local mmap = {}
  for key, value in pairs(M[plugin]) do
    if type(value) == "table" then
      mmap[#mmap + 1] = { value, key }
    end
  end
  for _, map in ipairs(mmap) do
    wk.register(map[1], { mode = map[2] })
  end
end

return M
