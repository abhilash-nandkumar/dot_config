local nvim_lsp = require('lspconfig')
local lsp_sigs = require('lsp_signature')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_attach = function(client, bufnr)
  lsp_sigs.on_attach({
      bind = true,
      hint_enable = false,
      handler_opts = {
        border = "shadow"
      }
    })

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = {silent = false, noremap = true}
  buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('v', '<leader>cf', '<cmd>lua function() vim.lsp.buf.range_formatting(vim.lsp.util.make_range_params()) end', opts)
  buf_set_keymap('n', '<leader>a', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

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
