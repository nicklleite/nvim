# Neovim Setup Summary

This document summarizes all key configurations and shortcuts used in your Neovim setup, structured using `init.lua` and modular files under `lua/user-settings`.

---

## File Structure

```
~/.config/nvim/
├── init.lua
└── lua/
    └── user-settings/
        ├── options.lua
        ├── keymaps.lua
        ├── commands.lua
        └── plugins/
            └── neotree.lua
```

---

## init.lua

```lua
require("user-settings.options")
require("user-settings.keymaps")
require("user-settings.commands")
require("user-settings.plugins.neotree")
```

---

## options.lua

```lua
local opt = vim.opt

opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers
opt.tabstop = 4            -- Number of spaces for a <Tab>
opt.shiftwidth = 4         -- Number of spaces for auto-indent
opt.expandtab = true       -- Convert tabs to spaces
opt.smartindent = true     -- Smart indentation
opt.wrap = false           -- Don't wrap long lines
opt.termguicolors = true   -- Enable true color support
```

---

## keymaps.lua

```lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "  -- Set <leader> to Space

-- Save
map("n", "<leader>w", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)
map("n", "<leader>q", ":wq<CR>", opts)

-- Move lines in Visual mode
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Fast escape from Insert mode
map("i", "jk", "<Esc>", opts)

-- Neotree toggle
map("n", "\\", ":Neotree toggle<CR>", opts)
```

---

## commands.lua

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/
//g]])
  end,
})
```

---

## plugins/neotree.lua (Lazy)

```lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["\\"] = "toggle_node",
        },
      },
    })

    vim.keymap.set("n", "\\", ":Neotree toggle<CR>", { noremap = true, silent = true })
  end,
}
```

---

## Useful Neovim Shortcuts

| Action                       | Shortcut           |
|-----------------------------|--------------------|
| Save (Normal mode)          | `<leader>w`        |
| Save (Insert mode)          | `<Ctrl> + s`       |
| Save and quit               | `<leader>q`        |
| Quit                        | `:q`               |
| Undo                        | `u`                |
| Redo                        | `<Ctrl> + r`       |
| Go to beginning of file     | `gg0`              |
| Go to end of file           | `G`                |
| Go to end of line           | `$`                |
| Start visual block mode     | `<Ctrl> + v`       |
| Move block up/down          | `J / K` in visual  |
| Toggle Neotree              | `\`               |

---

## Notes

- You can use `gg0` to jump to the first line and first column.
- The `jk` insert mode mapping allows quick escape without pressing `<Esc>`.
- Line ending cleanup (`\r`) is automatic on save.
