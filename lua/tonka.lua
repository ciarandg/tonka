-- [nfnl] Compiled from lua/tonka.fnl by https://github.com/Olical/nfnl, do not edit.
local tonka = {}
tonka.hello = function(opts)
  if opts.name then
    return print("hello,", opts.name)
  else
    return print("hello")
  end
end
tonka.setup = function(opts)
  local opts0 = (opts or {})
  print(opts0)
  local function _2_()
    return tonka.hello(opts0)
  end
  return vim.keymap.set("n", "<Leader>h", _2_)
end
return tonka
