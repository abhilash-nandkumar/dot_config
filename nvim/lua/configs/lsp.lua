local M = require "lspconfig"
local map = vim.keymap.set

-- export on_attach & capabilities
local custom_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "<leader>gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "<leader>gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>h", vim.lsp.buf.hover, opts "Hover")
  map("n", "<leader>fx", vim.lsp.buf.code_action, opts "Code action")
  map("n", "<leader>cr", vim.lsp.buf.rename, opts "Rename")
  map("n", "<leader>d", vim.diagnostic.open_float(0, {scope='line'}), opts "Show diagnostics")
  map("n", "<leader>f", vim.lsp.buf.format({async=true}), opts "Format file")

--   map("n", "<leader>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, opts "List workspace folders")

--   map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

--   map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

-- disable semanticTokens
local custom_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

M.defaults = function()
  require("lspconfig").lua_ls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    on_init = custom_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end


M.clangd.setup({
	cmd = { "docker", "exec", "-i" ,"jazzy_build", "/bin/sh", "-c", "clangd", "--log=error", "--background-index", "--clang-tidy","-j=4" },
	on_attach = custom_attach,
	capabilities = capabilities,
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "bashls", "cmake", "dockerls", "jsonls", "texlab", "pyright", "vimls" }
for _, lsp in ipairs(servers) do
	M[lsp].setup({
		on_attach = custom_attach,
		capabilities = capabilities,
	})
end

local lua_ls_root_path = os.getenv("HOME") .. "/.local/lua-language-server"
local lua_ls_binary = lua_ls_root_path .. "/bin/lua-language-server"
M.lua_ls.setup({
	cmd = { lua_ls_binary, "-E", lua_ls_root_path .. "/main.lua" },
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			completion = { enable = true, callSnippet = "Both" },
			diagnostics = {
				enable = true,
				globals = { "vim", "describe" },
				disable = { "lowercase-global" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.expand("/usr/share/awesome/lib")] = true,
				},
				-- adjust these two values if your performance is not optimal
				maxPreload = 2000,
				preloadFileSize = 1000,
			},
		},
	},
	on_attach = custom_attach,
})

return M
