-- language server protocol config
-- nvim-cmp setup (completion plugin)
local cmp = require "cmp"

cmp.setup({
   snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end
   },
   mapping = {
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
      ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   },
   sources = cmp.config.sources({
      {name = "nvim_lsp"}, {name = "vsnip"} -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
   }, {{name = "buffer"}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})

-- lspconfig config
local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- default all server to use completion capabilities
nvim_lsp.util.default_config.capabilities = capabilities

-- loop over all server and install if not installed
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local servers = {"efm", "eslint", "rust_analyzer", "sumneko_lua", "tsserver", "zk", "yamlls"}

local function install_server(lsp)
   local _, requested_server = lsp_installer_servers.get_server(lsp)
   if not requested_server:is_installed() then requested_server:install() end
end

for _, lsp in ipairs(servers) do install_server(lsp) end

-- loop over servers that only need default config
local easy_servers = {"eslint", "zk", "yamlls"}
for _, lsp in ipairs(easy_servers) do nvim_lsp[lsp].setup {flags = {debounce_text_changes = 150}} end

-- custom server configs
-- efm (https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/)
nvim_lsp.efm.setup {
   init_options = {documentFormatting = true},
   filetypes = {"lua"},
   settings = {
      rootMarkers = {".git/"},
      languages = {
         lua = {
            {
               -- based on https://github.com/luarocks/lua-style-guide
               formatCommand = "lua-format -i --no-use-tab --indent-width=3 --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --single-quote-to-double-quote",
               formatStdin = true
            }
         }
      }
   }
}

-- lua (https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/)
USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
   sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
   sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
elseif vim.fn.has("unix") == 1 then
   sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
   sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
else
   print("Unsupported system for sumneko")
end

nvim_lsp.sumneko_lua.setup {
   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
   settings = {
      Lua = {
         runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path
            path = vim.split(package.path, ";")
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {"vim", "use", "packer_plugins"}
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
         }
      }
   }
}

-- rust
nvim_lsp.rust_analyzer.setup {}
vim.g.rustfmt_autosave = 1 -- autoformat on save

-- ts
nvim_lsp.tsserver.setup {
   -- nvim-lsp-ts-utils setup
   init_options = require("nvim-lsp-ts-utils").init_options,
   --
   on_attach = function(client)
      local ts_utils = require("nvim-lsp-ts-utils")
      -- defaults
      ts_utils.setup({
         debug = false,
         disable_commands = false,
         enable_import_on_completion = false,
         -- use fast eslint
         eslint_bin = "eslint_d",
         -- import all
         import_all_timeout = 5000, -- ms
         -- lower numbers = higher priority
         import_all_priorities = {
            same_file = 1, -- add to existing import statement
            local_files = 2, -- git files or files with relative path markers
            buffer_content = 3, -- loaded buffer content
            buffers = 4 -- loaded buffer names
         },
         import_all_scan_buffers = 100,
         import_all_select_source = false,
         -- filter diagnostics
         filter_out_diagnostics_by_severity = {},
         filter_out_diagnostics_by_code = {},
         -- inlay hints
         auto_inlay_hints = true,
         inlay_hints_highlight = "Comment",
         -- update imports on file move
         update_imports_on_move = false,
         require_confirmation_on_move = false,
         watch_dir = nil
      })

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)
   end
}
