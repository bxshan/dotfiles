local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
require("luasnip.loaders.from_vscode").lazy_load()

require'luasnip'.config.setup({
-- add when i have choice nodes --
--  ext_opts = {
--    [types.choiceNode] = {
--      active = {
--        virt_text = {{"●", "GruvboxOrange"}}
--      }
--    },
--    [types.insertNode] = {
--      active = {
--        virt_text = {{"●", "GruvboxBlue"}}
--      }
--    }
--  },
})

-- from https://github.com/bibjaw99/workstation/blob/master/.config/nvim/lua/grimmvim/plugins/lsp/luasnip.lua

-- #########################
-- custom snippets here
-- #########################

-- CPP Snippets
ls.add_snippets("cpp", {
  s(
  "begin",
  fmt(
  [[
  #include <bits/stdc++.h>
  using namespace std;
  using ll = long long;
  #define int long long
  #define pb push_back
  #define mp make_pair
  #define endl '\n'
  #define f first
  #define s second 
  #define verysmall -1e18
  #define verybig 1e18
  #define fileio(file) freopen(file ".in", "r", stdin); freopen(file ".out", "w", stdout)
  #define pout(v); for (auto i : v) {{cout << i << " ";}} cout << endl;
  #define FOR(i, n, m) for (int i = (n); i < (m); i++)
  #define ROF(i, n, m) for (int i = (n); i > (m); i--)

  {}

  signed main() {{
    ios::sync_with_stdio(0);
    cin.tie(nullptr);

    {}

    return 0;
  }}
  ]],
  { 
    i(1, "int N;"),
    i(2, "cin >> N;"),
  }
  )
  ),

  s(
  "FOR",
  fmt(
  [[
  FOR({}, {}, {}) {{
    {}
  }}
  ]],
  { 
    i(1, "i"),
    i(2, "0"),
    i(3, "N"),
    i(4),
  }
  )
  ),
})
