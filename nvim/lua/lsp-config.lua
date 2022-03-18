local nvim_lsp = require('lspconfig')
local lsp_sigs = require('lsp_signature')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- local custom_attach = function(client)
--   lsp_sigs.on_attach({
--       bind = true,
--       hint_enable = false,
--       handler_opts = {
--         border = "shadow"
--       }
--     })

--   local opts = {buffer = 0, silent = false, remap = false}
--   vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, opts)
--   vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
--   vim.keymap.set('n', '<leader>f', vim.lsp.buf.code_action, opts)
--   vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
--   -- vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, opts)
--   vim.keymap.set('n', '<leader>d', vim.lsp.diagnostic.show_line_diagnostics, opts)
--   vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting, opts)
--   vim.keymap.set('v', '<leader>cf', function() vim.lsp.buf.range_formatting(vim.lsp.util.make_range_params()) end, opts)
--   vim.keymap.set('n', '<space>a', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
--   vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev, opts)
--   vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next, opts)
-- end

nvim_lsp.clangd.setup{
  cmd = { "clangd", "--log=error", "--background-index", "--clang-tidy", "-j=6", '--suggest-missing-includes'},
  on_attach = custom_attach,
  capabilities = capabilities
}

nvim_lsp.pylsp.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}

nvim_lsp.cmake.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}