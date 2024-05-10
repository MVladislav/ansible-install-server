# nvim

| mode | key                | command                                                               | topic     | description                    |
| :--- | :----------------- | :-------------------------------------------------------------------- | :-------- | :----------------------------- |
| n    | u                  | u                                                                     |           | revert/undo                    |
|      |                    |                                                                       |           |                                |
|      |                    |                                                                       |           |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>pv`       | `vim.cmd.Ex`                                                          | basic     | exit file                      |
| v    | `J`                | `:m '>+1<CR>gv=gv`                                                    | basic     | move line(s) down              |
| v    | `K`                | `:m '<-2<CR>gv=gv`                                                    | basic     | move line(s) up                |
| n    | `J`                | ``mzJ`z``                                                             | basic     | remove line below              |
| n    | `<C-d>`            | `<C-d>zz`                                                             | basic     |                                |
| n    | `<C-u>`            | `<C-u>zz`                                                             | basic     |                                |
| n    | `n`                | `nzzzv`                                                               | basic     | search next                    |
| n    | `N`                | `Nzzzv`                                                               | basic     | search prev                    |
| x    | `<leader>p`        | `[["_dP]]`                                                            | basic     |                                |
| n,v  | `<leader>y`        | `[["+y]]`                                                             | basic     | copy selected                  |
| n    | `<leader>Y`        | `[["+Y]]`                                                             | basic     | copy line                      |
| n,v  | `<leader>d`        | `[["_d]]`                                                             | basic     | delete selected                |
| i    | `<C-c>`            | `<Esc>`                                                               | basic     |                                |
| n    | `Q`                | `<nop>`                                                               | basic     |                                |
| n    | `<C-f>`            | `<cmd>silent !tmux neww tmux-sessionizer<CR>`                         | basic     | new session by script with fzf |
| n    | `<leader>f`        | `vim.lsp.buf.format`                                                  | basic     |                                |
| n    | `<C-k>`            | `<cmd>cnext<CR>zz`                                                    | basic     |                                |
| n    | `<C-j>`            | `<cmd>cprev<CR>zz`                                                    | basic     |                                |
| n    | `<leader>k`        | `<cmd>lnext<CR>zz`                                                    | basic     |                                |
| n    | `<leader>j`        | `<cmd>lprev<CR>zz`                                                    | basic     |                                |
| n    | `<leader>s`        | `[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]`              | basic     | replace by regex search        |
| n    | `<leader>x`        | `<cmd>!chmod +x %<CR>`                                                | basic     |                                |
| n    | `<leader><leader>` | `function: vim.cmd("so")`                                             | basic     |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>gs`       | `vim.cmd.Git`                                                         | git       |                                |
| n    | `<leader>gu`       | `<cmd>diffget //2<CR>`                                                | git       |                                |
| n    | `<leader>gh`       | `<cmd>diffget //3<CR>`                                                | git       |                                |
| n    | `<leader>gp`       | `:Gitsigns preview_hunk<CR>`                                          | git       |                                |
| n    | `<leader>gt`       | `:Gitsigns toggle_current_line_blame<CR>`                             | git       |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>a`        | `function: harpoon:list():append()`                                   | harpoon   |                                |
| n    | `<C-e>`            | `function: harpoon.ui:toggle_quick_menu(harpoon:list())`              | harpoon   |                                |
| n    | `<C-h>`            | `function: harpoon:list():select(1)`                                  | harpoon   |                                |
| n    | `<C-t>`            | `function: harpoon:list():select(2)`                                  | harpoon   |                                |
| n    | `<C-n>`            | `function: harpoon:list():select(3)`                                  | harpoon   |                                |
| n    | `<C-s>`            | `function: harpoon:list():select(4)`                                  | harpoon   |                                |
|      |                    |                                                                       |           |                                |
| n    | `gd`               | `function: vim.lsp.buf.definition()`                                  | lsp       |                                |
| n    | `K`                | `function: vim.lsp.buf.hover()`                                       | lsp       |                                |
| n    | `<leader>vws`      | `function: vim.lsp.buf.workspace_symbol()`                            | lsp       |                                |
| n    | `<leader>vd`       | `function: vim.diagnostic.open_float()`                               | lsp       |                                |
| n    | `<leader>vca`      | `function: vim.lsp.buf.code_action()`                                 | lsp       |                                |
| n    | `<leader>vrr`      | `function: vim.lsp.buf.references()`                                  | lsp       |                                |
| n    | `<leader>vrn`      | `function: vim.lsp.buf.rename()`                                      | lsp       |                                |
| i    | `<C-h>`            | `function: vim.lsp.buf.signature_help()`                              | lsp       |                                |
|      |                    |                                                                       |           |                                |
| i    | `<C-K>`            | `function: ls.expand()`                                               | snippets  |                                |
| i,s  | `<C-L>`            | `function: ls.jump(1)`                                                | snippets  |                                |
| i,s  | `<C-J>`            | `function: ls.jump(-1)`                                               | snippets  |                                |
| i,s  | `<C-E>`            | `function: ls.change_choice(1)`                                       | snippets  |                                |
| n    | `<leader>nf`       | `function: neogen.generate({ type = "func" })`                        | snippets  |                                |
| n    | `<leader>nt`       | `function: neogen.generate({ type = "type" })`                        | snippets  |                                |
| n    | `<leader>nd`       | `function: neogen.generate({ type = "typedef" })`                     | snippets  |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>pf`       | `builtin.find_files`                                                  | telescope |                                |
| n    | `<C-p>`            | `builtin.git_files`                                                   | telescope |                                |
| n    | `<leader>pws`      | `function: builtin.grep_string({ search = word })`                    | telescope |                                |
| n    | `<leader>pWs`      | `function: builtin.grep_string({ search = word })`                    | telescope |                                |
| n    | `<leader>ps`       | `function: builtin.grep_string({ search = vim.fn.input("Grep > ") })` | telescope |                                |
| n    | `<leader>vh`       | `builtin.help_tags`                                                   | telescope |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>tt`       | `function: toggle()`                                                  | trouble   |                                |
| n    | `<leader>tn`       | `function: next({ skip_groups = true, jump = true })`                 | trouble   |                                |
| n    | `<leader>tp`       | `function: previous({ skip_groups = true, jump = true })`             | trouble   |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>u`        | `vim.cmd.UndotreeToggle`                                              | undotree  |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>zz`       | `function: toggle()`                                                  | zenmode   |                                |
| n    | `<leader>zZ`       | `function: toggle()`                                                  | zenmode   |                                |
|      |                    |                                                                       |           |                                |
| n    | `<leader>fml1`     | `<cmd>CellularAutomaton make_it_rain<CR>`                             | fun       |                                |
| n    | `<leader>fml2`     | `<cmd>CellularAutomaton game_of_life<CR>`                             | fun       |                                |
|      |                    |                                                                       |           |                                |
