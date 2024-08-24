vim.api.nvim_create_user_command("CurrentPath",
  function()
    local file_path = vim.api.nvim_buf_get_name(0)
    vim.fn.setreg("+", file_path)
  end, { desc = "copy current path to clipboard" })


vim.api.nvim_create_user_command("CP",
  function()
    vim.cmd(":CurrentPath")
  end, { desc = "copy current path to clipboard" })
