-- 加载用户自定义配置
local init_custom_file_path = vim.api.nvim_get_runtime_file("init.custom.lua", false)[1]
if init_custom_file_path then
  dofile(init_custom_file_path)
end
