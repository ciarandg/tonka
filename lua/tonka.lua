-- [nfnl] Compiled from lua/tonka.fnl by https://github.com/Olical/nfnl, do not edit.
local tonka = {}
tonka.setup = function(opts)
  local opts0 = (opts or {})
  print(opts0)
  local function _1_()
    if opts0.name then
      return print("hello,", opts0.name)
    else
      return print("hello")
    end
  end
  return vim.keymap.set("n", "<Leader>h", _1_)
end
return tonka
