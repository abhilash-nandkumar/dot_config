local nvim_lsp = require("lspconfig")
local lsp_sigs = require("lsp_signature")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function(client, bufnr)
	lsp_sigs.on_attach({
		bind = true,
		hint_enable = false,
		handler_opts = {
			border = "shadow",
		},
	})

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { silent = false, noremap = true }
	buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	buf_set_keymap(
		"v",
		"<leader>f",
		"<cmd>lua function() vim.lsp.buf.range_formatting(vim.lsp.util.make_range_params()) end",
		opts
	)
	buf_set_keymap("n", "<leader>a", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
	-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

nvim_lsp.clangd.setup({
	cmd = { "clangd", "--log=error", "--background-index", "--clang-tidy", "-j=6", "--suggest-missing-includes" },
	on_attach = custom_attach,
	capabilities = capabilities,
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "bashls", "cmake", "dockerls", "jsonls", "texlab", "pyright", "vimls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = custom_attach,
		capabilities = capabilities,
	})
end

local sumneko_root_path = os.getenv("HOME") .. "/.config/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
nvim_lsp.sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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

-- Extra formatting and Linting
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.diagnostics.flake8,
	},
})
