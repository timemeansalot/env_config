-- local ls = require("luasnip")

local status_ok, luasnip= pcall(require, "luasnip.loaders.from_snipmate")
if not status_ok then
  return
end

luasnip.load({ paths = "~/.config/nvim/snippets/" })
