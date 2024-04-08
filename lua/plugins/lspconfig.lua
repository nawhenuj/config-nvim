return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        -- 'mfussenegger/nvim-jdtls'
    },
    config = function()
        local lspconfig = require("lspconfig")
        local on_attach = function()
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, { buffer = 0 })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = 0 })
            vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
            vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })
            vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
        end
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig.lua_ls.setup{
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        }
                    }
                }
            }
        }
        lspconfig.pyright.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig.jdtls.setup{
            on_attach = on_attach,
            capabilities = capabilities,
            -- settings = {
            --     use_lombok_agent = true
            -- },
            -- config = {
            --     cmd = {
            --         --     "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar"),
            --         "-javaagent:/home/nawhenuj/.local/share/nvim/mason/packages/jdtls/lombok.jar"
            --     }
            -- }
        }
        lspconfig.html.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig.htmx.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig.cssls.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig.tsserver.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig.gopls.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig.marksman.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
}
