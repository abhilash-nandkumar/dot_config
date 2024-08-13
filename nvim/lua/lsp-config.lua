-- Needs clangd bashls cmake dockerls jsonls texlabpyright, vimls
local nvim_lsp = require("lspconfig")
-- local telescope = require("telescope.builtin")
local lsp_sigs = require("lsp_signature")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

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
	buf_set_keymap("n", "<leader>fx", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>rf", "<cmd>lua require('telescope.builtin').lsp_references{}<CR>", opts)
	buf_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>er",
		"<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist=false}); require'telescope.builtin'.loclist{}<CR>",
		opts
	)
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
	cmd = { "docker", "exec", "-i" ,"noetic_build", "/bin/sh", "-c", "clangd", "--log=error", "--background-index", "--clang-tidy","-j=4" },
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

local lua_ls_root_path = os.getenv("HOME") .. "/.local/lua-language-server"
local lua_ls_binary = lua_ls_root_path .. "/bin/lua-language-server"
nvim_lsp.lua_ls.setup({
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

