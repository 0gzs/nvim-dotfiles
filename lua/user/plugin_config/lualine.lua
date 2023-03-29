local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = 100

local diagnostic = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = {
    error = { " ", "error" },
    warn = { " ", "warn" },
    info = { " ", "info" },
    hint = { " ", "hint" },
  },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = function()
    return vim.fn.winwidth(0) > hide_in_width
  end,
}

local filetypes = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icon = " ",
  cond = function()
    return vim.fn.winwidth(0) > hide_in_width
  end,
}

local location = {
  "location",
  icon = " ",
  cond = function()
    return vim.fn.winwidth(0) > hide_in_width
  end,
}

local progress = function()
  local current_line = vim.fn.line(".")
  local total_line = vim.fn.line("$")
  local chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
  local line_ratio = current_line / total_line
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { branch, diagnostic },
    lualine_b = {  },
    lualine_c = {},
    lualine_x = { diff, spaces, "encoding", filetypes },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})





