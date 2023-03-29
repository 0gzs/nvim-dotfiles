local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {'javascript', 'ruby', 'lua', 'bash', "python", 'json', 'typescript', 'elixir'}, -- one of "all" or a list of languages
  sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
  additional_vim_regex_highlighting = { "javascript", "lua", "json", "python" },
	indent = { enable = true, disable = { } },
})

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
