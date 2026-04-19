-- disable semanticTokens
local custom_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", {
	capabilities = capabilities,
	on_init = custom_init,
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "bashls", "cmake", "gopls", "nil_ls", "pyright", "rust_analyzer" }

-- toggle clangd command based on folder
vim.lsp.config("clangd", {
	cmd = {
		"docker",
		"exec",
		"-i",
		-- "ros1-noetic",
		"ros2-humble",
		"/bin/sh",
		"-c",
		"clangd",
		"--log=error",
		"--background-index",
		"--clang-tidy",
		"-j=4",
	},
})


vim.lsp.config("lua_ls", {
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

vim.lsp.enable(vim.list_extend(servers, { "clangd", "lua_ls" }))

-- turn off lsp logging
vim.lsp.log.set_level("error")
