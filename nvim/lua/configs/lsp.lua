local M = require("lspconfig")

-- disable semanticTokens
local custom_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.foldingRange = {
-- 	dynamicRegistration = false,
-- 	lineFoldingOnly = true,
-- }
--
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "bashls", "cmake", "nil_ls", "pyright", "rust_analyzer"}
for _, lsp in ipairs(servers) do
	M[lsp].setup({
		capabilities = capabilities,
		on_init = custom_init,
	})
end

-- toggle clangd command based on folder
M.clangd.setup({
	cmd = {
		"docker",
		"exec",
		"-i",
		"jazzy_build",
		"/bin/sh",
		"-c",
		"clangd",
		"--log=error",
		"--background-index",
		"--clang-tidy",
		"-j=4",
	},
	capabilities = capabilities,
	on_init = custom_init,
})


M.lua_ls.setup({
	capabilities = capabilities,
	on_init = custom_init,
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
})

-- turn off lsp logging
vim.lsp.set_log_level("off")
return M
