This is the command to use in the main.typ
```lua
lua local c=vim.lsp.get_clients({name="tinymist",bufnr=0})[1]; if c then
c:exec_cmd({command="tinymist.pinMain",arguments={vim.api.nvim_buf_get_name(0)}})
end
```
