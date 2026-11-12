return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  -- you can just use the latest version:
  -- branch = "latest",
  -- or the most up-to-date updates:
  -- branch = "nightly",
  keys = {
		{ "<leader>cc", "<cmd>Compile<cr>",   desc = "compile" },
        { "<leader>cr", "<cmd>Recompile<cr>", desc = "recompile" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- if you want to enable ANSI escape code support (colors && highlighting)
    -- in compilation output, add:
    { "m00qek/baleia.nvim", tag = "v1.3.0", submodules = false },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = { 
		default_command = {
			python = "python %",
			lua = "lua %",
			javascript = "bun %",
			typescript = "bun %",
			c = "gcc -o %:r % && ./%:r",
			cpp = "g++ -std=c++23 -o %:r % && ./%:r",
			java = "javac % && java %:r",
			go = "go run %",
			rust = "rustc % && ./%:r"
		},
		input_word_completion = true,
		bang_expansion = true,
		focus_compilation_buffer = true,
		-- if you use something like `nvim-cmp` or `blink.cmp` for completion,
        -- set this to fix tab completion in command mode:
        -- input_word_completion = true,

        -- to add ANSI escape code support (requires baleia.nvim):
        -- `baleia_options = {}` uses baleia's defaults, or pass a table to customize:
        ansi_color = { kind = "render", baleia_options = {} },
		debug = false,

        -- to enable OSC sequence handling (titles, hyperlinks, notifications):
        -- built-in handlers for OSC 0/1/2/8/9 are injected when `kind` is "render";
        -- `handlers = {}` uses them, or pass a table to override:
        -- ansi_osc = { kind = "render", handlers = {} },

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
    }
  end
}
