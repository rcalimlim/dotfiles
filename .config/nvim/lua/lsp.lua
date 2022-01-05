-- language server protocol config

-- nvim-cmp setup (completion plugin)
local cmp = require "cmp"

cmp.setup(
    {
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
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = 'vsnip'}, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)

-- lspconfig config
local nvim_lsp = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- default all server to use completion capabilities
nvim_lsp.util.default_config.capabilities = capabilities

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'vc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'vd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'vi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'vsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'vh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'vwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', 'vwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', 'vwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'vD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'vrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'vgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 've', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'vn', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'vp', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'vq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', 'vf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('i', '<expr> <Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', opts)
  buf_set_keymap('i', '<expr> <S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', opts)

end

-- loop over servers that only need default config
local servers = {
  'eslint',     -- eslint (js, ts)
  'zk',         -- markdown
  'tsserver',   -- ts
  'yamlls',     -- yaml
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- custom server configs
nvim_lsp.tsserver.setup {
    -- nvim-lsp-ts-utils setup
    init_options = require("nvim-lsp-ts-utils").init_options,
    --
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup(
            {
                debug = false,
                disable_commands = false,
                enable_import_on_completion = false,
                -- use fast eslint
                eslint_bin = 'eslint_d',
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
            }
        )

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)
    end
}
