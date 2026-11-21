require("config.options")
require("config.lazy")
require("config.keymaps")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("t")
    vim.opt_local.colorcolumn = ""
  end,
})
