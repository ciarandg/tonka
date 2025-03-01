-- [nfnl] Compiled from lua/tonka.fnl by https://github.com/Olical/nfnl, do not edit.
local tonka = {}
tonka.echo = function(str)
  local job = require("plenary.job")
  local myjob
  local function _1_(j, return_val)
    local lines = j:result()
    return lines[1]
  end
  myjob = job:new({command = "echo", args = {str}, cwd = "/", on_exit = _1_})
  return myjob:sync()[1]
end
tonka.hello = function(opts)
  if opts.name then
    return print("hello,", opts.name)
  else
    return print("hello")
  end
end
tonka.setup = function(opts)
  local opts0 = (opts or {})
  local function _3_()
    return print(tonka.echo("Hello from Tonka!"))
  end
  return vim.keymap.set("n", "<Leader>h", _3_)
end
return tonka
