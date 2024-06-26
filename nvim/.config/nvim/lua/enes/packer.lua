-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})
	--use ({
	--  "catppuccin/nvim", as = "catppuccin",
	--  --config = function()
	--  --    vim.cmd('colorscheme catppuccin')
	--  --end
	--})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("nvimtools/none-ls.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("github/copilot.vim")
	use("folke/zen-mode.nvim")
	use("jpalardy/vim-slime")

	-- Nvim DAP
	-- use 'mfussenegger/nvim-dap'
	-- use {
	--     "rcarriga/nvim-dap-ui",
	--     requires = { "mfussenegger/nvim-dap" },
	--     config = function()
	--         local dap = require("dap")
	--         local dapui = require("dapui")
	--         dapui.setup()
	--         dap.listeners.after.event_initialized["dapui_config"] = function()
	--             dapui.open()
	--         end
	--         dap.listeners.before.event_terminated["dapui_config"] = function()
	--             dapui.close()
	--         end
	--         dap.listeners.before.event_exited["dapui_config"] = function()
	--             dapui.close()
	--         end
	--     end
	-- }
	-- use {
	--     "mfussenegger/nvim-dap-python",
	--     requires = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
	--     config = function()
	--         local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	--         require("dap-python").setup(path)
	--     end
	-- }
end)
