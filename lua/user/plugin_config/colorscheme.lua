local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end

-- NIGHTFOX SETUP
nightfox.setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
    }
  }
})

local colorscheme = "nightfox"

status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  print("Unable to load colorscheme " .. colorscheme)
  return
end
