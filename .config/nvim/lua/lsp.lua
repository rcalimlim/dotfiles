-- Setup nvim-cmp.
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

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require "lspconfig"
lspconfig.util.default_config.capabilities = capabilities

-- ls json
lspconfig.jsonls.setup{}
-- ls: typescript
lspconfig.tsserver.setup {
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
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

        -- no default maps, so you may want to define some here
        local opts = {silent = true}
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end
}
lspconfig.yamlls.setup{}
lspconfig.zk.setup{}
