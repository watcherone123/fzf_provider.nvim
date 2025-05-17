## 说明
- 从https://github.com/wsdjeg/mru.nvim fork修改过来，支持fzf-lua打开最近的文件

## 使用


```lua
  {
    "watcherone123/fzf_provider.nvim",
    opts = {
       enable_cache = true,
        mru_cache_file = vim.fn.stdpath('data') .. '/nvim-mru.json',
        events = { 'BufEnter', 'BufWritePost' }, -- events to update mru file list
        ignore_path_regexs = { '/.git/' },
        enable_logger = true,
    },
  },
```

## License

This project is licensed under the GPL-3.0 License.
