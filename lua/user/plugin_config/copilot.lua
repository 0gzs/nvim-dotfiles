local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup {
  panel = {
    layout = {
      position = 'right',
    },
  },
  filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = false,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
  }
}

vim.cmd [[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]
vim.g.copilot_no_tab_map = true
