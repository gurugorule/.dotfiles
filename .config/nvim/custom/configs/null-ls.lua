local  null_ls = require("null-ls")

local opts = {
  source = {
    null_ls.builtins.formatting.clang_format,
  }
}
return opts 
