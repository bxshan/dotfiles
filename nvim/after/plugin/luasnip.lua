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
  #define INF 0x3f3f3f3f
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
    i(1, "int Q;"),
    i(2, "cin >> Q;"),
  }
  )
  ),

  s(
  "cf",
  fmt(
  [[
  #include <bits/stdc++.h>
  using namespace std;
  using ll = long long;
  using ull = unsigned long long;
  #define pb push_back
  #define mp make_pair
  #define endl '\n'
  #define f first
  #define s second 
  #define all(x) (x).begin(), (x).end()
  // const int verysmall = int(-1e9 - 7);
  // const int verybig = int(1e9 + 7);
  #define INF 0x3f3f3f3f
  #define fileio(file) freopen(file ".in", "r", stdin); freopen(file ".out", "w", stdout)
  #define pout(v); for (auto i : v) {{cout << i << " ";}} cout << endl;
  #define FOR(i, n, m) for (int i = (n); i < (m); i++)
  #define ROF(i, n, m) for (int i = (n); i > (m); i--)

  {}

  int main() {{
    ios::sync_with_stdio(0);
    cin.tie(nullptr);

    {}

    return 0;
  }}
  ]],
  { 
    i(2, "int N;"),
    i(3, "cin >> N;"),
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

s(
  "dsu",
  fmt(
    [[
struct DSU {{
  vector<int> p, sz;

  DSU(int N) {{
    p.resize(N);
    sz.assign(N, 1);
    iota(all(p), 0);
  }}

  int find(int x) {{
    if (p[x] != x) p[x] = find(p[x]);
    return p[x];
  }}

  void unite(int x, int y) {{
    x = find(x);
    y = find(y);
    if (x == y) return;

    if (sz[x] < sz[y]) swap(x, y);

    p[y] = x;
    sz[x] += sz[y];
  }}

  int size(int x) {{
    return sz[find(x)];
  }}

  bool isroot(int x) {{
    return find(x) == x;
  }}

  bool lian(int u, int v) {{
    return find(u) == find(v);
  }}
}};
]],
    {}
  )
),


s(
  "fastio",
  fmt(
    [[
    ios::sync_with_stdio(0);
    cin.tie(nullptr);
]],
    {}
  )
),


s(
  "modint",
  {
    t({
      "struct mint {",
      "  ll val;",
      "  static ll MOD;",
      "",
      "  mint(ll val = 0) {",
      "    this->val = val % MOD;",
      "    if (this->val < 0) this->val += MOD;",
      "  }",
      "",
      "  mint& operator += (const mint& o) {",
      "    this->val += o.val;",
      "    if (this->val >= MOD) this->val -= MOD;",
      "    return *this;",
      "  }",
      "",
      "  mint& operator -= (const mint& o) {",
      "    this->val -= o.val;",
      "    if (this->val < 0) this->val += MOD;",
      "    return *this;",
      "  }",
      "",
      "  mint& operator *= (const mint& o) {",
      "    this->val = (this->val * o.val) % MOD;",
      "    return *this;",
      "  }",
      "",
      "  mint power(ll n) const {",
      "    mint ret(1), base(val);",
      "    while (n) {",
      "      if (n & 1) ret *= base;",
      "      base *= base;",
      "      n >>= 1;",
      "    }",
      "    return ret;",
      "  }",
      "",
      "  mint inverse() const {",
      "    return power(MOD - 2);",
      "  }",
      "",
      "  mint& operator /= (const mint& o) {",
      "    return *this *= o.inverse();",
      "  }",
      "",
      "  friend mint operator + (mint a, const mint& b) { return a += b; }",
      "  friend mint operator - (mint a, const mint& b) { return a -= b; }",
      "  friend mint operator * (mint a, const mint& b) { return a *= b; }",
      "  friend mint operator / (mint a, const mint& b) { return a /= b; }",
      "",
      "  friend bool operator==(const mint& a, const mint& b) { return a.val == b.val; }",
      "  friend bool operator!=(const mint& a, const mint& b) { return a.val != b.val; }",
      "  friend bool operator< (const mint& a, const mint& b) { return a.val <  b.val; }",
      "  friend bool operator<=(const mint& a, const mint& b) { return a.val <= b.val; }",
      "  friend bool operator> (const mint& a, const mint& b) { return a.val >  b.val; }",
      "  friend bool operator>=(const mint& a, const mint& b) { return a.val >= b.val; }",
      "",
      "  friend ostream& operator<<(ostream& os, const mint& m) { return os << m.val; }",
      "  friend istream& operator>>(istream& is, mint& m) { ll x; is >> x; m = mint(x); return is; }",
      "};",
      "ll mint::MOD = "
    }),
    i(1, "1000000007"),
    t(";")
  }
),

s(
  "combinatorics",
  fmt(
    [[
mint fact[MAXN+1];
mint invf[MAXN+1];

void facts() {{
  fact[0] = 1;
  FOR(i, 1, MAXN+1) fact[i] = fact[i-1] * i; // mint
  invf[MAXN] = fact[MAXN].power(mint::MOD - 2);
  ROF(i, MAXN, 0) invf[i-1] = invf[i] * i;
}}

mint C(int n, int r) {{
  if (r < 0 || r > n) return mint(0);
  return fact[n] * invf[r] * invf[n-r];
}}


]],
    {}
  )
),

s(
  "segtree",
  fmt(
    [[
template<typename E>
struct SegmentTree {{
  int n;
  vector<E> tree;
  E d;

  SegmentTree(int size) {{
    d = E(); // default val
    n = size;
    tree.resize(4 * n, d); 
  }}

  void update(int node, int l, int r, int idx, E val) {{
    if (l == r) {{
      tree[node] += val;
    }} else {{
      int m = (l + r) / 2;
      if (idx <= m) {{
        update(2 * node, l, m, idx, val);
      }} else {{
        update(2 * node + 1, m + 1, r, idx, val);
      }}
      tree[node] = tree[2 * node] + tree[2 * node + 1];
    }}
  }}

  E query(int node, int l, int r, int ql, int qr) {{
    if (qr < l || r < ql) return d;
    if (ql <= l && r <= qr) return tree[node];
    int m = (l + r) / 2;
    return query(2 * node, l, m, ql, qr) + query(2 * node + 1, m + 1, r, ql, qr);
  }}

  int kth(int node, int l, int r, int k) {{
    if (l == r) return l;
    int lc = tree[2 * node];
    int m = (l + r) / 2;
    if (k <= lc) {{
      return kth(2 * node, l, m, k);
    }} else {{
      return kth(2 * node + 1, m + 1, r, k - lc);
    }}
  }}

  void u(int idx, E val) {{
    update(1, 0, n - 1, idx, val); 
  }}

  E q(int l, int r) {{
    return query(1, 0, n - 1, l, r);
  }}

  // debug
  void show() {{
    for(auto &i:tree) cout << i << " ";
    cout << endl;
  }}

  void showleaves() {{
    for(int i = 0; i < n; i++) cout << tree[n + i] << " ";
    cout << endl;
  }}
}};
]],
    {}
  )
),

      })
