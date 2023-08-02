-- Update this path
local extension_path = vim.env.HOME .. '/home/cicio/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
  codelldb_path = package_path .. "adapter\\codelldb.exe"
  liblldb_path = package_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

require'rust-tools'.setup{
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    }

}
