return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        -- 'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        -- 'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            completion = {
                completaeopt = 'menu,menuone,preview,noselect'
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
                ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                ['<C-q>'] = cmp.mapping.abort(),
                ['<C-l>'] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            })
        })
        local snippet = luasnip.snippet
        local text_node = luasnip.text_node
        local insert_node = luasnip.insert_node
        local function_node = luasnip.function_node

        local function word_under_cursor()
            local current_line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local _, start_col = current_line:sub(1, col):find("%w+$")
            local end_col, _ = current_line:sub(col + 1):find("%w+")
            start_col = start_col or col
            end_col = end_col and (col + end_col) or col
            return current_line:sub(start_col, end_col)
        end

        luasnip.snippets = {
            java = {
                -- Dynamic snippet for variable logging
                snippet("ldv", {
                    text_node("log.debug(\""),
                    insert_node(1, function_node(word_under_cursor)), -- Placeholder filled with the word under cursor or empty for manual input
                    text_node(" : {}\", "),
                    function_node(word_under_cursor, {}, insert_node(1)),
                    text_node(");")
                }),
                -- Dynamic snippet for method logging
                snippet("ldm", {
                    text_node("log.debug(\""),
                    insert_node(1), -- Manual input for class#method
                    text_node(" : {}\", "),
                    insert_node(2), -- Manual input for the method variable or additional info
                    text_node(");")
                })
            }
        }
    end
}
