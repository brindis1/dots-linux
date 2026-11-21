 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1e23',
    base01 = '#23282f',
    base02 = '#2c323a',
    base03 = '#616971',
    base04 = '#afb2b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#a691b6',
    base0A = '#8f8eb9',
    base0B = '#8ba3c1',
    base0C = '#c1afd0',
    base0D = '#acbdd3',
    base0E = '#afafd0',
    base0F = '#cecde4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1e23' })
  hi('TelescopeBorder',         { fg = '#616971',             bg = '#1a1e23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1e23' })
  hi('TelescopePromptBorder',   { fg = '#616971',             bg = '#1a1e23' })
  hi('TelescopePromptPrefix',   { fg = '#8ba3c1',             bg = '#1a1e23' })
  hi('TelescopePromptCounter',  { fg = '#afb2b6',  bg = '#1a1e23' })
  hi('TelescopePromptTitle',    { fg = '#1a1e23',             bg = '#8ba3c1' })
  hi('TelescopePreviewTitle',   { fg = '#1a1e23',             bg = '#8f8eb9' })
  hi('TelescopeResultsTitle',   { fg = '#1a1e23',             bg = '#a691b6' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#2c323a' })
  hi('TelescopeSelectionCaret', { fg = '#8ba3c1',             bg = '#2c323a' })
  hi('TelescopeMatching',       { fg = '#8ba3c1',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f2f3',          bg = '#1a1e23' })
  hi('MiniPickBorder',         { fg = '#616971',             bg = '#1a1e23' })
  hi('MiniPickPrompt',   { fg = '#f2f2f3',          bg = '#1a1e23' })
  hi('MiniPickPromptPrefix',   { fg = '#8ba3c1',             bg = '#1a1e23' })
  hi('MiniPickBorderText',    { fg = '#1a1e23',             bg = '#8ba3c1' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f2f3',          bg = '#2c323a' })
  hi('MiniPickPromptCaret', { fg = '#8ba3c1',             bg = '#2c323a' })
  hi('MiniPickMatchRanges',       { fg = '#8ba3c1',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
