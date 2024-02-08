local M = {}
M.version = "v1.0.1"

---@type UserConfig
M.config = require("guru.config")
--- @param user_config UserConfig
function M.setup(user_config)
  require("guru.utils.global")
  require("guru.basic")
  -- 用户配置覆盖
  M.config = vim.tbl_deep_extend("force", M.config, user_config)
  require("guru.env").init(M.config)
  require("guru.keybindings")
  local pluginManager = require("guru.lazy")
  if not pluginManager.avaliable() then
    pluginManager.install()
  end
  pluginManager.setup()
  require("guru.colorscheme").reset()
  require("guru.autocmds")
  require("guru.lsp")
  require("guru.cmp")
  require("guru.format")
  require("guru.dap")
  require("guru.utils.color-preview")
  if M.config.fix_windows_clipboard then
    require("lua.gurus.utils.fix-yank")
  end
end

return M
