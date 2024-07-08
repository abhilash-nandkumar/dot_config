vim.g.complete = "menu,menuone,noselect,noinsert"
-- vim.opt.shortmess:append "c"

-- luasnip setup
local luasnip = require("luasnip")

-- autopairs setup
require("nvim-autopairs").setup({})

-- lspkind
-- local ok, lspkind = pcall(require, "lspkind")
-- if not ok then
--   return
-- end

-- lspkind.init()

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	-- nvim-cmp by defaults disables autocomplete for prompt buffers
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		-- { name = "dap" },
		-- { name = "nvim_lua" },
		-- { name = "path" },
		{ name = "buffer", keyword_length = 5 },
	},
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		with_text = true,
	-- 		menu = {
	-- 			buffer = "[buf]",
	-- 			path = "[path]",
	-- 			luasnip = "[snip]",
	-- 		},
})
