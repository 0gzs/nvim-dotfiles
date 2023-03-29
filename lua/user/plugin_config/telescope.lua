local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        mirror = true,
      },
    },
    grep_prompt_prefix = "🔍 ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    path_display = { "shorten" },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})

telescope.load_extension('fzy_native')
vim.cmd('let $FZF_DEFAULT_COMMAND = \'ag -g ""\'')
