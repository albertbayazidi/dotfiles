vim.api.nvim_create_user_command("CurrentPath",
  function()
    local file_path = vim.api.nvim_buf_get_name(0)
    vim.fn.setreg("+", file_path)
  end, { desc = "copy current path to clipboard" })

vim.api.nvim_create_user_command("CP",
  function()
    vim.cmd(":CurrentPath")
  end, { desc = "copy current path to clipboard" })


vim.api.nvim_create_user_command("FlipDateFormat",
  function(opts)
    local substitution_regex = "s/\\(\\d\\+\\)\\.\\(\\d\\+\\)\\.\\(\\d\\+\\)/\\3.\\2.\\1/g"
    local effectArea = opts.args ~= "" and opts.args or "%"
    vim.cmd(effectArea .. substitution_regex)
  end,
  {
    desc = "Flips date format of dd.mm.yyyy to yyyy.mm.dd, and vice versa",
    nargs = "?"
  })

vim.api.nvim_create_user_command("FDF",
  function()
    vim.cmd("FlipDateFormat")
  end,
  { desc = "Flips date format of dd.mm.yyyy to yyyy.mm.dd, and vice versa" })

vim.api.nvim_create_user_command("Vg",
  function()
    vim.cmd("vertical G")
  end,
  { desc = "makes a verical buffer for Git status" })
