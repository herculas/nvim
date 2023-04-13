local status_lua, luasnip = pcall(require, "luasnip")
if not status_lua then
  vim.notify("[LSP] luasnip not found.")
  return
end

local status_cnf, config = pcall(require, "config")
if not status_cnf then
  vim.notify("[LSP] global config not found.")
  return
end

local status_typ, types = pcall(require, "luasnip.util.types")
if not status_typ then
  vim.notify("[LSP] luasnip.util.types not found.")
  return
end

-- TODO: custom snippets

luasnip.config.set_config({
  history = true,
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<--", "Error" } },
      },
    },
  },
})

local luasnip_keys = config.lua_snip_keys

vim.keymap.set({ "i", "s" }, luasnip_keys.jump_next, function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end)

vim.keymap.set({ "i", "s" }, luasnip_keys.jump_prev, function ()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end)

vim.keymap.set({ "i", "s" }, luasnip_keys.next_choice, function ()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

vim.keymap.set({ "i", "s" }, luasnip_keys.prev_choice, function ()
  if luasnip.choice_active() then
    luasnip.change_choice(-1)
  end
end)
